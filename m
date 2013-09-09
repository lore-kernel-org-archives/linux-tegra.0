From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 08/11] tegrarcm: Add rip support
Date: Mon, 09 Sep 2013 15:50:30 -0600
Message-ID: <522E42A6.6090104@wwwdotorg.org>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com> <1378757761-20939-9-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-9-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/09/2013 02:15 PM, Allen Martin wrote:
> Add a new command "--ripbct" which will rip the BCT from the target
> system and write it to bctfile.

Bikeshed: s/rip/read/ or get or download? rip sounds a bit like a CD.

> diff --git a/src/main.c b/src/main.c

> @@ -97,6 +99,8 @@ static void usage(char *progname)
>  	fprintf(stderr, "\t\tPrint this help information\n");
>  	fprintf(stderr, "\t--version\n");
>  	fprintf(stderr, "\t\tPrint version information and exit\n");
> +	fprintf(stderr, "\t--ripbct\n");
> +	fprintf(stderr, "\t\tRead the BCT from the target device and write to bctfile\n");
>  	fprintf(stderr, "\n");
>  }

It might be nice to try and make it more explicit that there are now 2
modes of operation, and have separate sections in the usage text to
detail both. That would also help point out that e.g. --bootloader is
now only required in non-(--rip)-mode.

I wonder if we should make this a sub-command rather than an option
("rip" rather than "--rip").

> +static int rip_bct(nv3p_handle_t h3p, char *filename)

> +	printf("bct: 0x%02x 0x%02x 0x%02x 0x%02x\n", bct_data[0], bct_data[1], bct_data[2], bct_data[3]);

Left-over debugging?

> +	if (write(fd, bct_data, bct_info.length) != bct_info.length) {
> +		dprintf("short write on %s\n", filename);
> +		return errno;
> +	}

What if a signal gets delivered here; don't you need to loop until the
whole buffer has been written? I don't recall whether fwrite() would do
that automatically.

> diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in

> +.TP
> +.B \-\-ripbct
> +Read the BCT from the target device and write it to \fIbctfile\fP.  If
> +this option is specified, the --bootloader, --loadaddr, and
> +--entryaddr options are ignored.

Same comment here as for the usage text above.
