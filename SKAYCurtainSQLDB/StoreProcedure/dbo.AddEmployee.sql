CREATE PROCEDURE [dbo].[AddEmployee]

	@PhoneNumber NVARCHAR(13), 
    @FName NVARCHAR(23), 
    @MName NVARCHAR(23), 
    @LName NVARCHAR(23),
	@Gender NVARCHAR(7),
    @Salary FLOAT, 
    @Branch NVARCHAR(20), 
    @Position NVARCHAR(23), 
    @Photo VARBINARY(MAX)

	as
	Begin
	Insert Into Employees 
	Values(@PhoneNumber, @FName, @MName, @LName, @Gender, @Salary,  @Branch, @Position, @Photo);
	End