From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH 1/2] Add Tegra124 bct data access for jtag
 control and chip uid
Date: Fri, 21 Mar 2014 13:50:01 -0600
Message-ID: <532C97E9.6010308@wwwdotorg.org>
References: <1395394886-8145-1-git-send-email-pchiu@nvidia.com> <1395394886-8145-2-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395394886-8145-2-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/21/2014 03:41 AM, Penny Chiu wrote:
...
> @@ -940,6 +941,12 @@ t124_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)

> +	case token_unique_chip_id:
> +		memcpy(data,
> +		&(bct_ptr->unique_chip_id),
> +		sizeof(nvboot_ecid));
> +		break;

The indentation there is wrong; parameters need to be indented at least
one level more than the function they're being passed to, and I think
you can wrap at least some of them one fewer lines.
