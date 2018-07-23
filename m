From: Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH 1/2] Add sw2_sw4 voltage table to cpcap regulator.
Date: Mon, 23 Jul 2018 13:57:44 -0400
Message-ID: <63de1504-5fc7-ee9c-9d91-69d0b2e3b944@gmail.com>
References: <d38d3fea-dc7d-09fe-651e-386b36befde1@gmail.com>
 <20180723170157.GD13981@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723170157.GD13981@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07/23/2018 01:01 PM, Mark Brown wrote:
> On Fri, Jul 20, 2018 at 08:43:49PM -0400, Peter Geis wrote:
>> SW2 and SW4 use a shared table to provide voltage to the cpu core and
>> devices on Tegra hardware.
>> Added this table to the cpcap regulator driver as the first step to
>> supporting this device on Tegra.
> 
> This fails to apply with:
> 
> Applying: Add sw2_sw4 voltage table to cpcap regulator.
> .git/rebase-apply/patch:37: trailing whitespace.
>                                                 1437500, 1450000,
> error: corrupt patch at line 38
> Patch failed at 0001 Add sw2_sw4 voltage table to cpcap regulator.
> 
> Please check and resend.
> 
Apologies, I accidentally converted all of the tabs to spaces.
Re-sending both patches with tabulation intact.
