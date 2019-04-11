From: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] memory: tegra: Make terga20_mc_reset_ops static
Date: Thu, 11 Apr 2019 20:25:24 +0800
Message-ID: <ceb5d977-afd2-a21a-11b8-e5f426288c68@huawei.com>
References: <20190410140450.31604-1-yuehaibing@huawei.com>
 <20190411093301.GC4633@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411093301.GC4633@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: jonathanh@nvidia.com, digetx@gmail.com, jroedel@suse.de, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 2019/4/11 17:33, Thierry Reding wrote:
> On Wed, Apr 10, 2019 at 10:04:50PM +0800, Yue Haibing wrote:
>> From: YueHaibing <yuehaibing@huawei.com>
>>
>> Fix sparse warning:
>>
>> drivers/memory/tegra/tegra20.c:277:33: warning:
>>  symbol 'terga20_mc_reset_ops' was not declared. Should it be static?
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/memory/tegra/tegra20.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied thanks. I noticed that you use a slightly different name in your
> git author settings and your email setup. The only difference seems to
> be a space between the first and last name, so you may want to look into
> that to avoid having any inconsistencies.

Yeah, indeed, I will fix my git config, thanks!

> 
> Thierry
> 
