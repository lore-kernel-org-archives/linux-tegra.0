From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Check offsets of a submitted command buffer
 and of relocations
Date: Mon, 15 May 2017 11:01:59 +0300
Message-ID: <b66483ca-4f75-1943-bd7d-c67a1cf12935@gmail.com>
References: <20170514204734.22130-1-digetx@gmail.com>
 <20170514204734.22130-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170514204734.22130-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14.05.2017 23:47, Dmitry Osipenko wrote:
>  	/* copy and resolve relocations from submit */
>  	while (num_relocs--) {
> +		struct host1x_reloc *reloc;
> +		struct tegra_bo *obj;
> +
>  		err = host1x_reloc_copy_from_user(&job->relocarray[num_relocs],
>  						  &relocs[num_relocs], drm,
>  						  file);
>  		if (err < 0)
>  			goto fail;
> +
> +		reloc = &job->relocarray[num_relocs];
> +		obj = host1x_to_tegra_bo(reloc->cmdbuf.bo);
> +
> +		if (reloc->cmdbuf.offset & 3 ||
> +		    reloc->cmdbuf.offset > obj->gem.size) {
> +			err = -EINVAL;
> +			goto fail;
> +		}
> +
> +		obj = host1x_to_tegra_bo(reloc->target.bo);
> +
> +		if (reloc->target.offset & 3 ||
> +		    reloc->target.offset > obj->gem.size) {
> +			err = -EINVAL;
> +			goto fail;
> +		}
>  	}

The relocation offsets should be compared as '>=' as well.

-- 
Dmitry
