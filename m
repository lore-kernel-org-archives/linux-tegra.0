From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ASoC: tegra: add Tegra114 support to the AHUB driver
Date: Mon, 25 Mar 2013 10:19:05 -0600
Message-ID: <515078F9.1070800@wwwdotorg.org>
References: <1363895802-20484-1-git-send-email-swarren@wwwdotorg.org> <20130325155232.GR18316@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130325155232.GR18316-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/25/2013 09:52 AM, Mark Brown wrote:
> On Thu, Mar 21, 2013 at 01:56:41PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> Tegra114's AHUB shares a design with Tegra30, with the followin
>> changes: * Supports more (10 vs. 4) bi-directional FIFO channels
>> into RAM.
> 
> Applied but...

Thanks.

>> +	clocks = <&tegra_car 106>, <&tegra_car 107>, <&tegra_car 30>, +
>> <&tegra_car 11>, <&tegra_car 18>, <&tegra_car 101>, +
>> <&tegra_car 102>, <&tegra_car 108>, <&tegra_car 109>, +
>> <&tegra_car 110>, <&tegra_car 162>; +	clock-names = "d_audio",
>> "apbif", "i2s0", "i2s1", "i2s2", +		"i2s3", "i2s4", "dam0",
>> "dam1", "dam2", +		"spdif_in";
> 
> ...this is exactly what I was worried about with the clock bindings
> :/

What's the exact issue here? The length of the list is rather
determined by the HW, so I don't think there's much one can do about that.
