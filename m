From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/7] soc/tegra: pmc: Use BIT macro for register field
 definition
Date: Tue, 12 Apr 2016 22:28:10 +0530
Message-ID: <570D2922.7050403@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com> <1460473007-11535-2-git-send-email-ldewangan@nvidia.com> <20160412152642.GA30211@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160412152642.GA30211@ulmo.ba.sec>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 12 April 2016 08:56 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Tue, Apr 12, 2016 at 08:26:41PM +0530, Laxman Dewangan wrote:
>> Use BIT macro for register field definition and make constant as
>> unsigned when using in shift operator like instead of (3 << 30),
>> make it to (3U << 30).
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> ---
>>   drivers/soc/tegra/pmc.c | 42 +++++++++++++++++++++---------------------
>>   1 file changed, 21 insertions(+), 21 deletions(-)
> Does this matter at all? We use the explicit notation in quite a number
> of places and it works great. I'd like to avoid needless churn unless
> there is a very good reason to switch.

When I run the checkpatch, I got the error and thought that better to 
fix and cleanup some warning/error from checkpatch.
This is just part of cleanups and properly defining constant like 3U 
instead of 3 to avoid any issue.



