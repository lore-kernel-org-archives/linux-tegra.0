From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2 0/9] Some Tegra I2C Updates
Date: Fri, 26 Aug 2016 17:41:45 +0100
Message-ID: <98812229-1539-1189-e4f2-8c558990c7ac@nvidia.com>
References: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
 <20160826155628.GD1608@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20160826155628.GD1608@katana>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 26/08/16 16:56, Wolfram Sang wrote:
> * PGP Signed by an unknown key
> 
> On Fri, Aug 26, 2016 at 02:08:56PM +0100, Jon Hunter wrote:
>> Add runtime-pm and pinctrl support for Tegra I2C driver.
>>
>> The first 6 patches are trivial clean-up/simplification changes.
>>
>> Changes since V1:
>> - Fixed cppcheck warning reported by Wolfram
>> - Added 3 more clean-up patches to fix some checkpatch issues
> 
> Thanks looks good. Now we only need to find out which one to apply
> first, this one or "[v8,1/3] i2c: tegra: use readx_poll_timeout after
> config_load reg programmed" and following. I cced you on the other mail.

Yes I had not bothered basing mine on top as it seem to be stagnant.
However, if Shardar updates his series I am happy to rebase. I will be
out for a week and so I will pick this up when I get back.

Cheers!
Jon

-- 
nvpublic
