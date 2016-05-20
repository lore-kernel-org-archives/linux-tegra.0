From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V6 3/3] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Fri, 20 May 2016 15:11:10 +0100
Message-ID: <573F1AFE.3080906@nvidia.com>
References: <1463745564-19297-1-git-send-email-ldewangan@nvidia.com>
 <1463745564-19297-4-git-send-email-ldewangan@nvidia.com>
 <573F11F5.7010702@nvidia.com> <573F125A.20102@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <573F125A.20102@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org
Cc: gnurou@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 20/05/16 14:34, Laxman Dewangan wrote:
> 
> On Friday 20 May 2016 07:02 PM, Jon Hunter wrote:
>> On 20/05/16 12:59, Laxman Dewangan wrote:
>>> +/* tegra_io_pads_config_info: Tegra IO pads bit config info.
>>> + * @dpd_config_bit: DPD configuration bit position. -1 if not
>>> supported.
>>> + * @voltage_config_bit: Voltage configuration bit position. -1 if
>>> not supported.
>>> + * @soc_mask: Bitwise OR of SoC masks if IO pads supported on that SoC.
>>> + */
>> Comment coding style :-(
> 
> I saw this style multiple places and so intentionally left here.
> If comment is inside the code then
> /*
>  * first-line comment
>  * second line
>  */
> 
> but for function, it can have in single line.
> 
> Anyhow, I will correct in next cycle.

Actually, this should be in kernel-doc format [0].

Jon

[0] Documentation/kernel-doc-nano-HOWTO.txt
