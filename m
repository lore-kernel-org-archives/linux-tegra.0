Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61C3A9D8A;
	Mon,  9 Mar 2026 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074446; cv=none; b=NHKFklcGky28r1nOXh6zPxB0QJ8q5iZXEPAMEIZi3tewsReww/X6B0qEdAqyjjxULsYlVvlFLmjKPAwCP/FDgHXnLQwMAWoIjcoPojR5+fh7b0BiNxQmPZBr9OtA3E2MjqmYICEG03vzWsVxoR3VsawTnthOMt09UrmTrR9oFs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074446; c=relaxed/simple;
	bh=v9zpzo6QVhWYqFPLJMzQmIGNKcHXo0KX6tcAhLVt8Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLuGdqpcTTLM6ZuEOxYqjOCww6WoxNN86i9hkGPnJoUmhUho5Mca8t1dGrOvMh/ztjd/frE/aJ/EtcXcUkXMRr7Z6nrmH1AsixWZoi0cXj2d4K4+NziLb6F5A0qaj9KXLfIDAsrMHUZy8zCP4wc0TjFOzVQX2Y3Ug8WJIrWU3gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WERtxANT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WERtxANT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5360C4CEF7;
	Mon,  9 Mar 2026 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773074446;
	bh=v9zpzo6QVhWYqFPLJMzQmIGNKcHXo0KX6tcAhLVt8Ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WERtxANTtcJQYS8ib1tGXCGkHQisGy9HXwAC/AfhYsS7/trXyly9gPKRruRKEQba6
	 29pEJiT0FhX9K/WYE1AmMCKokM/SpdEGf0NS/murHTQZPN/2qRAapRRjW4Nbfz9Oc4
	 BNNzVJHpRNwPs2emUZjfslPJoddyQNEi71gK32T4=
Date: Mon, 9 Mar 2026 17:40:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: marvin24@gmx.de, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: fix block comment style in nvec.c
Message-ID: <2026030929-uncheck-reclining-315b@gregkh>
References: <20260304191853.4500-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304191853.4500-1-rayfraytech@gmail.com>

On Wed, Mar 04, 2026 at 08:18:53PM +0100, Oskar Ray-Frayssinet wrote:
> Fix block comment formatting to use * on subsequent lines
> and */ on a separate line as required by kernel coding style.
> 
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08448..ee2715df3b48 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -646,7 +646,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  			nvec->state = 2;
>  		}
>  		break;
> -	case 2:		/* first byte after command */
> +	case 2:		/* First byte after command */

THis change is not what you document above as being changed :(

