From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] dt: add empty of_get_property for non-dt
Date: Tue, 9 Aug 2011 11:27:48 -0600
Message-ID: <20110809172748.GA32195@ponder.secretlab.ca>
References: <1312584630-23371-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1312584630-23371-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Axel Lin <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 05, 2011 at 04:50:30PM -0600, Stephen Warren wrote:
> The patch adds empty function of_get_property for non-dt build, so that
> drivers migrating to dt can save some '#ifdef CONFIG_OF'.
> 
> This also fixes the current Tegra compile problem in linux-next.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  include/linux/of.h |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)

Merged, thanks.

g.

> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 0085bb0..9180dc5 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -256,6 +256,13 @@ static inline int of_property_read_string(struct device_node *np,
>  	return -ENOSYS;
>  }
>  
> +static inline const void *of_get_property(const struct device_node *node,
> +				const char *name,
> +				int *lenp)
> +{
> +	return NULL;
> +}
> +
>  #endif /* CONFIG_OF */
>  
>  static inline int of_property_read_u32(const struct device_node *np,
> -- 
> 1.7.0.4
> 
