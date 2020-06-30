From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 53/73] arm64: tegra: Remove simple regulators bus
Date: Tue, 30 Jun 2020 12:16:15 +0100
Message-ID: <608faebb-3497-baac-354a-25261915af73@nvidia.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-54-thierry.reding@gmail.com>
 <fe583ea8-6a66-f78e-b926-5d0ed775361f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fe583ea8-6a66-f78e-b926-5d0ed775361f-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 30/06/2020 12:11, Jon Hunter wrote:
> 
> On 16/06/2020 14:52, Thierry Reding wrote:
>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> The standard way to do this is to list out the regulators at the top-
>> level. Adopt the standard way to fix validation.
>>
>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../arm64/boot/dts/nvidia/tegra132-norrin.dts | 247 ++++++------
>>  .../boot/dts/nvidia/tegra186-p2771-0000.dts   |  81 ++--
>>  .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  60 ++-
>>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  96 ++---
>>  .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  23 +-
>>  .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 274 +++++++------
>>  .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi | 361 ++++++++----------
>>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 177 ++++-----
>>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 137 +++----
>>  9 files changed, 671 insertions(+), 785 deletions(-)
> 
> 
> After this patch is applied I see the following build breakage ...
> 
>   DTC     arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb
> arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi:1646.23-1656.4: ERROR
> (phandle_references): /regulator@1: Reference to non-existent node or
> label "pmic"
> 
> arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi:1658.30-1670.4: ERROR
> (phandle_references): /regulator@2: Reference to non-existent node or
> label "pmic"
> 
> arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi:1705.29-1715.4: ERROR
> (phandle_references): /regulator@6: Reference to non-existent node or
> label "pmic"


Actually it might not be this patch. However, I noticed that builds were
getting skipped when bisecting other issues. So we may need to ensure
all of these build OK.

Jon

-- 
nvpublic
