From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] tegra: Enable pre-console putc() for Tegra boards
Date: Fri, 09 Mar 2012 09:57:06 -0700
Message-ID: <4F5A3662.3040009@wwwdotorg.org>
References: <1331261577-21099-1-git-send-email-sjg@chromium.org> <1331261577-21099-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331261577-21099-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/08/2012 07:52 PM, Simon Glass wrote:
> This is used to display panic messages before the console is active.
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I applied both these patches on top of u-boot-tegra/master, built for
Ventana, and loaded/ran u-boot.bin, and don't see any useful serial
output; there's a bit of periodic binary spew. u-boot-dtb.bin works as
expected.

So, these patches don't appear to solve the problem.
