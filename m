From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v1 2/4] thermal: tegra: remove unnecessary warnings
Date: Fri, 9 Nov 2018 15:21:23 +0800
Message-ID: <ec9e034a-2789-2433-aad7-8d493d2d67c8@nvidia.com>
References: <1541410354-19090-1-git-send-email-wni@nvidia.com>
 <1541410354-19090-3-git-send-email-wni@nvidia.com>
 <20181108124716.GE1340@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108124716.GE1340@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 8/11/2018 8:47 PM, Thierry Reding wrote:
> On Mon, Nov 05, 2018 at 05:32:32PM +0800, Wei Ni wrote:
>> Convert warnings to info as not all platforms may
>> have all the thresholds and sensors enabled.
>>
>> Signed-off-by: Wei Ni <wni@nvidia.com>
>> ---
>>  drivers/thermal/tegra/soctherm.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> This seems overly generalized to me. Shouldn't we be checking in a more
> fine-grained way for the absence of thresholds and/or sensors?
> 
> Otherwise, how are going to make the difference between the sensor not
> being enabled or the device tree just missing the information?
> 
The sensor being enabled or not is controlled by device tree, if the dts
have the corresponding nodes, then the sensors should be enabled. And
the thresholds for sensor are not necessary, so I think we just need to
print out them.
BTW, in my patch 1/4, I should print out the sensor name if the sensor
not enabled and register failed.
Will update it.

> Thierry
> 
