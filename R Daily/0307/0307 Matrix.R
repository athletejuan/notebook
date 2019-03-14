# Matrices
# Matrix(data, nrow, ncol, byrow, dimnames)

m_data <- matrix(c(1,2,3,4), nrow=2)
m_data

m_data <- matrix(c(3:14), nrow=3, byrow=FALSE)
m_data

m_data2 <- matrix(1:6, nrow=3)
m_data2

row_names = c('row1','row2','row3')
col_names = c('col1','col2')
m_data3 <- matrix(1:6, nrow=3, dimnames=list(row_names, col_names))
m_data3

m_colnames = c('col1','col2')
m_rownames = c('row1','row2','row3')
m_matrix <- matrix(1:6, nrow=3, dimnames=list(m_rownames, m_colnames))
m_matrix
m_matrix[1,2]
m_matrix[2,]
m_matrix[,2]

m_matrix2 <- matrix(7:12, nrow=3, dimnames=list(m_rownames, m_colnames))
m_matrix2
m_matrix3=m_matrix+m_matrix2
m_matrix3

# Array
v1 <- c(1,2,3)
v2 <- c(10,11,12,13,14,15)
row_names <- c('row1','row2','row3')
col_names <- c('col1','col2','col3')
matrix_names <- c('matrix1','matrix2')

arr <- array(c(v1,v2), dim=c(3,3,2), dimnames=list(row_names,col_names,matrix_names))
arr
arr[,,2]
test <- arr[,,2]
test2 <- arr[,,2]
test
test2

# apply

v3 <- c(1,2,3,10,11,12,13,14,15)
v4 <- c(1,1,1,1,1,1,1,1,1)

data.array <- array(c(v3,v4), dim=c(3,3,2))
data.array

result <- apply(data.array, c(1), sum)
result