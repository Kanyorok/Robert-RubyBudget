module HomeHelper
    def truncate_words(text, num_words)
      if text.present?
        words = text.split(' ')
        truncated_text = words.take(num_words).join(' ')
        truncated_text + (words.length > num_words ? '...' : '')
      else
        ''
      end
    end
  end