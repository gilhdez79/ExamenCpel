using System;
using ExamenCPP.Models.Request;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ExamenCPP.Models
{
    public partial class BKdbExamenContext : DbContext
    {
        public BKdbExamenContext()
        {
        }

        public BKdbExamenContext(DbContextOptions<BKdbExamenContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ConfiguracionPercepciones> ConfiguracionPercepciones { get; set; }
        public virtual DbSet<Empleado> Empleado { get; set; }
        public virtual DbSet<EmpleadoPercepcion> EmpleadoPercepcion { get; set; }
        public virtual DbSet<EmpleadoRol> EmpleadoRol { get; set; }
        public virtual DbSet<Nomina> Nomina { get; set; }
        public virtual DbSet<TbMovimientosEmpleados> TbMovimientosEmpleados { get; set; }
        public virtual DbSet<TbRolTrabajador> TbRolTrabajador { get; set; }

       

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=(local);Database=BKdbExamen;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ConfiguracionPercepciones>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Fecha)
                    .HasColumnName("fecha")
                    .HasColumnType("datetime");
            });

            modelBuilder.Entity<Empleado>(entity =>
            {
                entity.Property(e => e.Nombre).HasMaxLength(100);

                entity.Property(e => e.NumeroEmpleado).HasMaxLength(10);
            });

            modelBuilder.Entity<EmpleadoPercepcion>(entity =>
            {
                entity.HasNoKey();

                entity.Property(e => e.IdEmpleado)
                    .HasColumnName("idEmpleado")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IdPercepcion).HasColumnName("idPercepcion");

                entity.HasOne(d => d.IdEmpleadoNavigation)
                    .WithMany()
                    .HasForeignKey(d => d.IdEmpleado)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EmpleadoPercepcion_Empleado1");

                entity.HasOne(d => d.IdPercepcionNavigation)
                    .WithMany()
                    .HasForeignKey(d => d.IdPercepcion)
                    .HasConstraintName("FK_EmpleadoPercepcion_Percepciones");
            });

            modelBuilder.Entity<EmpleadoRol>(entity =>
            {
                entity.HasNoKey();

                entity.HasOne(d => d.IdEmpleadoNavigation)
                    .WithMany()
                    .HasForeignKey(d => d.IdEmpleado)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EmpleadoRol_Empleado");

                entity.HasOne(d => d.IdRolNavigation)
                    .WithMany()
                    .HasForeignKey(d => d.IdRol)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EmpleadoRol_TbRolTrabajador");
            });

            modelBuilder.Entity<Nomina>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Fecha).HasColumnType("datetime");

                entity.Property(e => e.IdEmpleado).HasColumnName("id_Empleado");

                entity.Property(e => e.IdPercepcion).HasColumnName("idPercepcion");

                entity.Property(e => e.TotalSr).HasColumnName("TotalSR");
            });

            modelBuilder.Entity<TbMovimientosEmpleados>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.FechaMovimiento).HasColumnType("date");

                entity.Property(e => e.IdRol).HasColumnName("Id_Rol");

                entity.HasOne(d => d.IdEmpleadoNavigation)
                    .WithMany(p => p.TbMovimientosEmpleados)
                    .HasForeignKey(d => d.IdEmpleado)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TbMovimientosEmpleados_Empleado");
            });

            modelBuilder.Entity<TbRolTrabajador>(entity =>
            {
                entity.Property(e => e.RolNombre).HasMaxLength(50);
            });


      

            OnModelCreatingPartial(modelBuilder);
        }


        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
