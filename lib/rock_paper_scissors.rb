class RockPaperScissors

    # Exceptions this class can raise:
    class NoSuchStrategyError < StandardError ; end

        def self.winner(player1, player2)
            raise NoSuchStrategyError.new("Strategy must be one of R,P,S") unless ['r','p','s'].include? player1[1].downcase and ['r','p','s'].include? player2[1].downcase
        
            if player1[1].downcase == "r" and player2[1].downcase == "s"
                return player1
            elsif player1[1].downcase == "s" and player2[1].downcase == "p"
                return player1
            elsif player1[1].downcase == "p" and player2[1].downcase == "r"
                return player1
            elsif player1[1].downcase == player2[1].downcase
                return player1
            else
                return player2	
	       end
        end

        def self.tournament_winner(tournament)
	       if tournament[0][0].is_a? String
		      return winner(tournament[0], tournament[1])
	       else
		      return winner(tournament_winner(tournament[0]), tournament_winner(tournament[1]))
	       end
        end
end