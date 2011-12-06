From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/5] ASoC: WM8903: Add device tree binding
Date: Tue, 06 Dec 2011 13:06:58 -0600
Message-ID: <4EDE67D2.2020507@gmail.com>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com>
 <1322863721-29793-6-git-send-email-swarren@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1750B773EE@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1750B773EE-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 12/06/2011 12:22 PM, Stephen Warren wrote:
> Stephen Warren wrote at Friday, December 02, 2011 3:09 PM:
>> Document the device tree binding for the WM8903 codec, and modify the
>> driver to extract platform data from the device tree, if present.
> 
> Mark,
> 
> I just realized that when I was re-organizing all the WM8903 patches, I
> dropped the part that added the of_match table to the driver:
> 
> +static const struct of_device_id wm8903_of_match[] __devinitconst = {
> +	{ .compatible = "wlf,wm8903", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, wm8903_of_match);
> 
> Now, everything still works without this. Looking at the Linux OF code,
> it works by retrieving the compatible property, taking everything after
> the comma if present, and then creating an i2c_board_info with that
> type, which in this case is "wm8903" and matches wm8903.c's i2c_device_id
> table. See drivers/of/of_i2c.c:of_i2c_register_devices() and the call to
> base.c:of_modalias_node().
> 
> So, the question is: Should I go back and add the of_match table, or
> is I2C intended to work without it perpetually? I notice that you added
> an of_match table for all the other WM codecs.

It definitely tries to match first with the OF match table, so it should
probably be added back.

Rob
