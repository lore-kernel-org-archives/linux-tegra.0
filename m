From: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Subject: Re: [v3 0/6] ARM: tegra: convert device tree files to use CLK
 defines
Date: Sun, 17 Feb 2013 16:05:17 -0600
Message-ID: <1361138717.29465.2@driftwood>
References: <1360917814-27236-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360917814-27236-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> (from
	hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org on Fri Feb 15 02:43:11 2013)
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/15/2013 02:43:11 AM, Hiroshi Doyu wrote:
> Hi,
> 
> With new dtc+cpp feature, we could get rid of magic numbers in dts*
> files. This patch replaces CLK IDs.
> 
> We also plan to share those DT header files with kernel source
> later[1].
...
> [1]  
> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-February/149804.html

This really smells like documentation should be updated, probably  
booting-without-of.txt or similar. Alas, I'm not capable of writing  
such an update...

Rob--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
