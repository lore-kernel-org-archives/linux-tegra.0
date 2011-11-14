From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 01/10] arm/tegra: initial device tree for tegra30
Date: Mon, 14 Nov 2011 09:41:13 -0600
Message-ID: <4EC13699.5030205@gmail.com>
References: <1321010541-31337-1-git-send-email-pdeschrijver@nvidia.com> <1321010541-31337-2-git-send-email-pdeschrijver@nvidia.com> <4EBDE766.5080505@gmail.com> <20111114152518.GJ19069@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111114152518.GJ19069-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/14/2011 09:25 AM, Peter De Schrijver wrote:
> On Sat, Nov 12, 2011 at 04:26:30AM +0100, Rob Herring wrote:
>> On 11/11/2011 05:22 AM, Peter De Schrijver wrote:
>>> This patch adds the initial device tree for tegra30
>>>
>>> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/tegra30.dtsi |  127 ++++++++++++++++++++++++++++++++++++++++
>>>  1 files changed, 127 insertions(+), 0 deletions(-)
>>>  create mode 100644 arch/arm/boot/dts/tegra30.dtsi
>>>
>>> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
>>> new file mode 100644
>>> index 0000000..fabe243
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/tegra30.dtsi
>>> @@ -0,0 +1,127 @@
>>> +/include/ "skeleton.dtsi"
>>> +
>>> +/ {
>>> +	compatible = "nvidia,tegra30";
>>
>> Needs documentation.
>>
>>> +	interrupt-parent = <&intc>;
>>> +
>>> +	intc: interrupt-controller@50041000 {
>>> +		compatible = "nvidia,tegra30-gic", "nvidia,tegra20-gic";
>>> +		interrupt-controller;
>>> +		#interrupt-cells = <1>;
>>
>> Is the Tegra GIC really different from a standard A9 gic? You need to
>> update to use the gic binding. The cells should be 3 for example.
> 
> It has an extra 'legacy' interrupt controller like tegra20 has. This is used
> when waking up the CPU from power off mode.

Although that is probably not part of the GIC h/w (i.e. at a different
address) and should be described in the dts separately. That doesn't
change the GIC binding or the fact that you are using
arch/arm/common/gic.c though. Whether you have a different compatible
string or not is not really the issue. That can already be supported if
necessary. The issue is you are not using the existing GIC binding as a
starting point and that has implications on every node using a GIC
interrupt.

Rob
