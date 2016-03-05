From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 1/4] Add option "--pkc"
Date: Fri, 4 Mar 2016 17:43:01 -0800
Message-ID: <20160305014301.GB19189@nvidia.com>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-2-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457135087-967-2-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 04, 2016 at 03:44:44PM -0800, Jimmy Zhang wrote:
> Add the support code needed to sign the RCM messages with RSA-PSS as
> needed to communicate with secured production devices. This mode is
> enabled by passing a key via the --pkc command line argument. If such
> a key is set the RCM messages will be signed with it as well as the
> bootloader.
> 
> Signed-off-by: Alban Bedel <alban.bedel@...>
> ---


> diff --git a/src/main.c b/src/main.c
> index 3db0ed8be506..fedeab2e1402 100644
> --- a/src/main.c
> +++ b/src/main.c

> @@ -123,6 +126,10 @@ static void usage(char *progname)
>  	fprintf(stderr, "\t\tminiloader\n");
>  	fprintf(stderr, "\t--miniloader_entry=<mlentry>\n");
>  	fprintf(stderr, "\t\tSpecify the entry point for the miniloader\n");
> +	fprintf(stderr, "\t--pkc=<key.ber>\n");

.der?
Also "--pkcs" might be more accurate, or even better "--rsa-pss"
Please update man page as well

> +extern "C" int rsa_pss_sign_file(const char *key_file, const char *msg_file,
> +			unsigned char *sig_buf)

Make this function a wrapper around rsa_pss_sign() to avoid the code
duplication. 

-Allen
