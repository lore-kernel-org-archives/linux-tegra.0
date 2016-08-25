From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 5/6] i2c: tegra: Add runtime power-management support
Date: Thu, 25 Aug 2016 21:53:09 +0100
Message-ID: <c546ae53-005e-83d7-136d-d12a83b58549@nvidia.com>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
 <1470910620-9898-6-git-send-email-jonathanh@nvidia.com>
 <20160825192631.GA1614@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160825192631.GA1614@katana>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 25/08/16 20:26, Wolfram Sang wrote:
> * PGP Signed by an unknown key
> 
> 
>> @@ -407,32 +410,39 @@ static inline int tegra_i2c_clock_enable(struct tegra_i2c_dev *i2c_dev)
>>  			return ret;
>>  		}
>>  	}
>> +
>>  	ret = clk_enable(i2c_dev->div_clk);
>>  	if (ret < 0) {
>>  		dev_err(i2c_dev->dev,
>>  			"Enabling div clk failed, err %d\n", ret);
>>  		clk_disable(i2c_dev->fast_clk);
>> +		return ret;
>>  	}
>> -	return ret;
>> +
>> +	return 0;
> 
> You could have left the original 'return' instead of the 2 new ones, but
> you decide.

Yes I know, but I wanted to ensure for runtime-pm we only return 0 on
success. Yes clk_enable should only return 0 on success and a negative
error code otherwise, but I prefer this. So will leave as-is.

>> -	if (tegra_i2c_flush_fifos(i2c_dev))
>> -		err = -ETIMEDOUT;
>> +	err = tegra_i2c_flush_fifos(i2c_dev);
> 
> 'err' is assigned but where is it checked?

It will be returned by the function. This is no different to how it
works today if you look at the code. I did think about checking it right
after this call and returning but then I am changing the behaviour and
that should be another patch. I am not sure why it is like this in the
first place, but I did not wish to introduce any different behaviour here.

Cheers
Jon

-- 
nvpublic
