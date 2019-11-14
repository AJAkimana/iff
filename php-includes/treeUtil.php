<?php

    class AmountCalculator
    {
        private $conn;
        private $leftCount;
        private $rightCount;

        public function __construct($leftCount, $rightCount)
        {
            require_once 'connect.php';
            $this->conn = $con;
            $this->leftCount = $leftCount;
            $this->rightCount = $rightCount;
        }

        public function matchUsers()
        {
            $match = 0;
            if ($this->leftCount < $this->rightCount) {
                $match = $this->leftCount;
            } elseif ($this->leftCount > $this->rightCount) {
                $match = $this->leftCount;
            } elseif ($this->leftCount == $this->rightCount) {
                $match = $this->leftCount = $this->rightCount;
            }

            return $match + 1;
        }

        public function indirectUsers()
        {
            $indirect = 0;
            if ($this->leftCount > 2 && $this->rightCount > 2) {
                $indirect = 1;
            }

            return $indirect;
        }
    }