From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv2 09/11] tegrarcm: Add readbct support
Date: Tue, 17 Sep 2013 15:19:52 -0600
Message-ID: <5238C778.1030805@wwwdotorg.org>
References: <1379370298-20404-1-git-send-email-amartin@nvidia.com> <1379370298-20404-10-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379370298-20404-10-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/16/2013 04:24 PM, Allen Martin wrote:
> Add a new command "readbct" which will read the BCT from the target
> system and write it to bctfile.

> diff --git a/src/main.c b/src/main.c

> +static int read_bct(nv3p_handle_t h3p, char *filename)

> +	buf = bct_data;
> +	while(bct_info.length > 0) {
> +		ssize_t written = write(fd, buf, bct_info.length);
> +		if (written == -1) {
> +			if (errno == EINTR)
> +				continue;
> +			dprintf("error writing to %s\n", filename);
> +			return errno;

"ret = errno; goto out;" might be more appropriate there ...

> +		}
> +		buf += written;
> +		bct_info.length -= written;
> +	}

> +
> +	free(bct_data);
> +	close(fd);
> +	return 0;

and that could be:

	ret = 0;
out:
	free(bct_data);
	close(fd);
	return ret;

That way, everything gets closed/freed in the error paths to, albeit
it's not too relevant since the app will just immediately exit anyway.

Perhaps some of the other error paths also skip cleanup; I didn't check.

Feel free to fix this up as you apply or as a separate patch later.
