From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 5/6] dt: Document Tegra20/30 pinctrl binding
Date: Wed, 21 Mar 2012 09:57:14 -0600
Message-ID: <4F69FA5A.9020504@wwwdotorg.org>
References: <1332265479-1260-1-git-send-email-swarren@wwwdotorg.org> <1332265479-1260-5-git-send-email-swarren@wwwdotorg.org> <20120321091919.GA18592@shlinux2.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120321091919.GA18592-Fb7DQEYuewWctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/21/2012 03:19 AM, Dong Aisheng wrote:
> On Wed, Mar 21, 2012 at 01:44:38AM +0800, Stephen Warren wrote:
>> Define a new binding for the Tegra pin controller, which is capable of
>> defining all aspects of desired pin multiplexing and pin configuration.
>> This is all based on the new common pinctrl bindings.
>>
>> Add Tegra30 binding based on Tegra20 binding.
>>
>> Add some basic stuff that was missing before:
>> * How many and what reg property entries must be provided.
>> * An example.
>>
>> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>> ---
> ........
>> +Example board file extract:
>> +
>> +	pinctrl@70000000 {
>> +		sdio4_default {
>> +			atb {
>> +				nvidia,pins = "atb", "gma", "gme";
>> +				nvidia,function = "sdio4";
>> +				nvidia,pull = <0>;
>> +				nvidia,tristate = <0>;
>> +			};
>> +		};
>> +	};
>> +
>> +	sdhci@c8000600 {
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&sdio4_default>;
>
> A typo error? sdio4_default is not a phandle.

Yes.

>> +Example board file extract:
>> +
>> +	pinctrl@70000000 {
>> +		sdmmc4_default: pinmux {
>> +			sdmmc4_clk_pcc4 {
>> +				nvidia,pins =	"sdmmc4_clk_pcc4",
>> +						"sdmmc4_rst_n_pcc3";
>> +				nvidia,function = "sdmmc4";
>> +				nvidia,pull = <0>;
>> +				nvidia,tristate = <0>;
>> +			};
>> +			sdmmc4_dat0_paa0 {
>> +				nvidia,pins =	"sdmmc4_dat0_paa0",
>> +						"sdmmc4_dat1_paa1",
>> +						"sdmmc4_dat2_paa2",
>> +						"sdmmc4_dat3_paa3",
>> +						"sdmmc4_dat4_paa4",
>> +						"sdmmc4_dat5_paa5",
>> +						"sdmmc4_dat6_paa6",
>> +						"sdmmc4_dat7_paa7";
>> +				nvidia,function = "sdmmc4";
>> +				nvidia,pull = <2>;
>> +				nvidia,tristate = <0>;
>
> It seems it does not support per pin config for tegra30 and we have to
> separate them in different nodes with same group config value, right?

Sorry, I don't understand the question.

On Tegra30, pin mux selection and some pin configuration parameters are
per-pin. Other pin configuration parameters are per-group. The pinctrl
driver defines groups for:

* Each pin (for per-pin properties)
* Each group that has non-per-pin configuration parameters.

You can use either/both sets of groups in the .dts file (i.e. in the
nvidia,pins property).

You'd never end up with a single node that mixes the "per-pin" group
names and "non-per-pin" group names, simply because there are no
properties that can be applied to groups of both types in hardware.
