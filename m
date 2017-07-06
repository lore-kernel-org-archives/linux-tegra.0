From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 4/9] ARM: tegra: Enable UDC on TrimSlice
Date: Thu, 6 Jul 2017 10:35:39 -0600
Message-ID: <d387a37e-d4d2-9144-b4ed-45d637e0a82a@wwwdotorg.org>
References: <cover.1499273075.git.digetx@gmail.com>
 <82321d32d968c6b9481a77fbecae8c0756d37f0f.1499273075.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <82321d32d968c6b9481a77fbecae8c0756d37f0f.1499273075.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/05/2017 11:19 AM, Dmitry Osipenko wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Override the compatible string of the first USB controller to enable
> device mode.

> diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts

>   	usb@c5000000 {
> +		compatible = "nvidia,tegra20-udc";
>   		status = "okay";
> +		dr_mode = "otg";
>   	};

As mentioned elsewhere in this thread, there is a mux between this Tegra 
USB port and the external micro USB connector and the internal USB 
USB-SATA adapter, such that the micro USB connector is routed to Tegra 
in USB recovery mode, but the USB-SATA adapter is routed to Tegra at 
other times. Making the change above will prevent using the USB-SATA 
adapter, so I don't think we should make this change.
