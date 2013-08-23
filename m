From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH 1/1] Add Tegra124 support
Date: Fri, 23 Aug 2013 13:05:11 -0600
Message-ID: <5217B267.3030205@wwwdotorg.org>
References: <1377229591-21235-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377229591-21235-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/22/2013 09:46 PM, Penny Chiu wrote:
> Add the Tegra124 chip support to cbootimage. User can use "-t124" as
> option to parse .cfg and generate BCT/image for Tegra124.

This looks fine to me at a quick glance. Just one small comment below:

> diff --git a/src/cbootimage.c b/src/cbootimage.c

>  	printf("Usage: cbootimage [options] configfile imagename\n");
>  	printf("    options:\n");
> -	printf("    -h, --help, -?        Display this message.\n");
> -	printf("    -d, --debug           Output debugging information.\n");
> -	printf("    -gbct                 Generate the new bct file.\n");
> -	printf("    -o<ODM_DATA>          Specify the odm_data(in hex).\n");
> -	printf("    [-t20|-t30|-t114]     Select one of the possible target devices,\n");
> -	printf("                          -t20 if unspecified.\n");
> -	printf("    configfile            File with configuration information\n");
> -	printf("    imagename             Output image name\n");
> +	printf("    -h, --help, -?              Display this message.\n");
> +	printf("    -d, --debug                 Output debugging information.\n");
> +	printf("    -gbct                       Generate the new bct file.\n");
> +	printf("    -o<ODM_DATA>                Specify the odm_data(in hex).\n");
> +	printf("    [-t20|-t30|-t114|-t124]     Select one of the possible target devices,\n");
> +	printf("                                -t20 if unspecified.\n");
> +	printf("    configfile                  File with configuration information\n");
> +	printf("    imagename                   Output image name\n");
>  }

To avoid continually re-formatting that text when adding new SoCs, why
not start the description of the -tNN options on a separate line, and
leave the indentation as-is for all the unmodified lines. i.e.:

>> +	printf("    [-t20|-t30|-t114|-t124]\n");
>> +	printf("                          Select one of the possible target devices,\n");
>> +	printf("                          -t20 if unspecified.\n");

I tested this patch, and it has zero effect on any of the generated
images in the cbootimage-configs project, as expected, so I think it's
safe to accept.
