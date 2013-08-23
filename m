From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [patch 2/2] gpu: host1x: returning success instead of -ENOMEM
Date: Fri, 23 Aug 2013 13:16:30 -0600
Message-ID: <5217B50E.5020101@wwwdotorg.org>
References: <20130823101911.GA1824@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130823101911.GA1824-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?ISO-8859-1?Q?Terje_Ber?= =?ISO-8859-1?Q?gstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/23/2013 04:19 AM, Dan Carpenter wrote:
> There is a mistake here so it returns PTR_ERR(NULL) which is success
> instead of -ENOMEM.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> ---
> I can't compile this.

For the record, just do:

export CROSS_COMPILE=xxx
make ARCH=arm tegra_defconfig
make ARCH=arm zImage

The only slightly difficult part is getting a CROSS_COMPILE value. Many
distros ship at least some ARM cross-compiler in their standard
package-set these days, and if not, you can download the Linaro
compilers or go to ftp://ftp.kernel.org/pub/tools/crosstool/index.html.
