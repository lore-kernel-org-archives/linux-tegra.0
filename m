From: Mikko Perttunen <mikko.perttunen@kapsi.fi>
Subject: Re: [PATCH v5 3/3] ARM: tegra: Add thermal reset (thermtrip) support
 to PMC
Date: Tue, 06 Jan 2015 17:56:21 +0200
Message-ID: <54AC05A5.5040401@kapsi.fi>
References: <1420541578-27968-1-git-send-email-mikko.perttunen@kapsi.fi> <1420541578-27968-4-git-send-email-mikko.perttunen@kapsi.fi> <20150106151427.GQ31830@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150106151427.GQ31830@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: swarren@wwwdotorg.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, wni@nvidia.com, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 01/06/2015 05:14 PM, Thierry Reding wrote:
> On Tue, Jan 06, 2015 at 12:52:58PM +0200, Mikko Perttunen wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> This adds a device tree controlled option to enable PMC-based
>> thermal reset in overheating situations. Thermtrip is supported on
>> Tegra30, Tegra114 and Tegra124. The thermal reset only works when
>> the thermal sensors are calibrated, so a soctherm driver is also
>> required.
>>
>> The thermtrip event is triggered by the soctherm block, and all
>> soctherm sensors default to showing a temperature of zero Celsius
>> before they are initialized. Because of this, it is safe to initialize
>> thermtrip and soctherm in any order.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   drivers/soc/tegra/pmc.c | 107 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 107 insertions(+)
>
> This looks good to me. I'm not sure if I asked before, but can this be
> tested? Can we somehow trick thermtrip into reporting a temperature that
> would trigger this?
>
> Thierry
>

Yep, you can find a program here: 
https://gist.github.com/cyndis/66126c9c176b5f94a76f

It sets the thermtrip threshold to zero degrees.

Mikko
