From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V1] i2c: tegra: fix tegra186 hw supported features
Date: Mon, 18 Feb 2019 09:34:38 +0000
Message-ID: <42aa92c1-309e-88c1-1cd6-07592990730b@nvidia.com>
References: <1550334787-27703-1-git-send-email-skomatineni@nvidia.com>
 <20190218084227.GB19363@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218084227.GB19363@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: talho@nvidia.com, wsa@the-dreams.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 18/02/2019 08:42, Thierry Reding wrote:
> On Sat, Feb 16, 2019 at 08:33:07AM -0800, Sowjanya Komatineni wrote:
>> Tegra186 does not support multi-master mode and also there is no
>> master fifo control register.
>>
>> This patch fixes supported features of Tegra186 and prevents
>> crashing during boot as master fifo control register are not
>> present on Tegra186 and prior.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> We really should've caught this earlier. Jon, let's think about ways to
> make it easier to catch these things in the future on our test system.

Indeed. This has fixed the boot regression I was seeing over the weekend
on -next for Tegra186. However, I am bit confused here, because when I
look at the Tegra186 TRM it states that the I2C supports multi-master
mode which disagrees with this patch. Furthermore, it seems odd that
Tegra210 and Tegra194 would support multi-master mode but Tegra186 does
not. So is this really correct?

Cheers
Jon

-- 
nvpublic
