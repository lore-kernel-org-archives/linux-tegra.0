From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2] usb: host: xhci-tegra: set MODULE_FIRMWARE for
 tegra186
Date: Wed, 22 Jan 2020 16:54:05 +0200
Message-ID: <ee78d12c-d3f5-e122-e4bd-b43b2cc79a3c@linux.intel.com>
References: <20200120141910.116097-1-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200120141910.116097-1-pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 20.1.2020 16.19, Peter Robinson wrote:
> Set the MODULE_FIRMWARE for tegra186, it's registered for 124/210 and
> ensures the firmware is available at the appropriate time such as in
> the initrd, else if the firmware is unavailable the driver fails with
> the following errors:
> 
> tegra-xusb 3530000.usb: Direct firmware load for nvidia/tegra186/xusb.bin failed with error -2
> tegra-xusb 3530000.usb: failed to request firmware: -2
> tegra-xusb 3530000.usb: failed to load firmware: -2
> tegra-xusb: probe of 3530000.usb failed with error -2
> 
> Fixes: 5f9be5f3f899 ("usb: host: xhci-tegra: Add Tegra186 XUSB support")
> Signed-off-by: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

Thanks, added to queue

-Mathias
