From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] i2c: tegra: Correct error path in probe
Date: Mon, 27 Jun 2016 15:02:59 +0530
Message-ID: <5770F2CB.2090109@nvidia.com>
References: <1465936007-18599-1-git-send-email-jonathanh@nvidia.com> <5770F1D4.8000406@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5770F1D4.8000406@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Shardar Shariff Md <smohammed@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Monday 27 June 2016 02:58 PM, Jon Hunter wrote:
> Hi all,
>
> On 14/06/16 21:26, Jon Hunter wrote:
>> @@ -912,7 +912,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>>   	ret = tegra_i2c_init(i2c_dev);
>>   	if (ret) {
>>   		dev_err(&pdev->dev, "Failed to initialize i2c controller");
>> -		goto unprepare_div_clk;
>> +		goto disable_div_clk;
>>   	}
>>

Yes, this looks correct.

Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
