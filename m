From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v3 1/3] thermal: tegra: remove unnecessary warnings
Date: Thu, 29 Nov 2018 14:43:56 +0800
Message-ID: <65fd540d-f05c-ab53-1c14-b9f3679ec2a3@nvidia.com>
References: <1543383877-20555-1-git-send-email-wni@nvidia.com>
 <1543383877-20555-2-git-send-email-wni@nvidia.com>
 <20181128101227.GB20723@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128101227.GB20723@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 28/11/2018 6:12 PM, Thierry Reding wrote:
> On Wed, Nov 28, 2018 at 01:44:35PM +0800, Wei Ni wrote:
>> Convert warnings to info as not all platforms may
>> have all the thresholds and sensors enabled.
>>
>> Signed-off-by: Wei Ni <wni@nvidia.com>
>> ---
>>  drivers/thermal/tegra/soctherm.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> If these are all optional anyway, why even keep the informational
> messages? While those may not show up as warnings in the log, they will
> still be unconditional noise in the kernel log. Do we really want that,
> or should we just trust that the DT is correct and shut up if optional
> thresholds and sensors are not present?
> 
> Thierry

I think we can trust the DT files, but these trip points are important,
it's better to notify user about these information. And user also can
change log level to control these messages.

Thanks.
Wei.
> 
