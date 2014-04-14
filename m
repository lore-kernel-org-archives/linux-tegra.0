From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Oops on Tegra30 with CPU Process: 1
Date: Mon, 14 Apr 2014 13:16:50 -0600
Message-ID: <534C3422.1050004@wwwdotorg.org>
References: <53440884.7010304@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53440884.7010304-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/08/2014 08:32 AM, Marcel Ziswiler wrote:
> Hi there
> 
> I have the following Toradex Colibri T30 modules with different ATE prog
> versions, Tegra30 SKUs as well as CPU process numbers:
> 
> Colibri T30 V1.1B (working)
> 
> [    0.000000] fuse_speedo_calib: ATE prog ver 3.6
> [    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
> [    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 2 Core Process: 0
> 
> Colibri T30 V1.1C (below crash)
> 
> [    0.000000] fuse_speedo_calib: ATE prog ver 3.7
> [    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
> [    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 1 Core Process: 0

I /think/ that if you run the following command in U-Boot before booting
the kernel:

i2c mw 0x60 3 0x46

... that may solve the problem (assuming the kernel doesn't explicitly
reprogram the regulator for VDD CORE during boot).

(you might need to adjust "3" to match whatever I2C bus the TPS62631 is
attached to; "i2c dev N; i2c probe" for various N might help find it).

That command changes the TPS62361's regulator output from 1.16V (HW
default I believe) to 1.2V, which I believe is the necessary minimum
voltage for a 1.0V VDD_CPU, which is what at least mainline U-Boot sets up.

Let me know if that works for you.

BTW, I'd be interested to know where exactly the crash you quoted occurs
within the overall boot process.
