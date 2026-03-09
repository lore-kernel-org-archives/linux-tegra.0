Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D099538F255;
	Mon,  9 Mar 2026 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074488; cv=none; b=U6vpyy3zP0Aca4ZqsHgKSRRTHa2HKJ7I3dC2PmsnbsclHyq+sojkEJjqmYxbrxgniezlJRfmy/ZYl6lGB6gXvUz/VfbzNiXqyMwJcxB/7YbeWuaGReGAhXhMw5HbvzgXfaAsw6+i35R+skyh539ej5GjER8yJsYgicookGSwuGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074488; c=relaxed/simple;
	bh=t3YCf1SWRA0HE4WX5qVMZsjk5TNK9PxdC+HYt7iW4Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfPo7K2cTe/ul6v0tEsGeDnL+GEtgA2JvMrguRs37cGy0MzbACCvRUtdTgSZ37geSzGR73Zozk0ET2k2W4t5zGq89XelnNKDK4jbPBAmMWceevHVkdQyRUqXDnzhjcmahEb400uKOYpaGHl/7v48LB8qDzMT8G/LgoIDFRg1Dmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R4AHU70u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R4AHU70u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB36C4CEF7;
	Mon,  9 Mar 2026 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773074488;
	bh=t3YCf1SWRA0HE4WX5qVMZsjk5TNK9PxdC+HYt7iW4Yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R4AHU70uxWIlsMlqojkA0widX4JejcWB/L06AJKRTUDuzQ52pddGvd9OJc50hg8hf
	 BcO8lpBca0+TyyPEgxe+TTsFAf0lEppPEQs7aORRkAOdPXL/d+8aNjXcftPZj7VTrb
	 KdBjC8jZCy9Qb8kqO6J6JkNWXDZWpNsBFQEoA0TM=
Date: Mon, 9 Mar 2026 17:41:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: marvin24@gmx.de, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] staging: nvec: fix block comment style in nvec.c
Message-ID: <2026030921-wanted-playpen-0d26@gregkh>
References: <20260305010924.40335-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305010924.40335-1-hossu.alexandru@gmail.com>

On Thu, Mar 05, 2026 at 02:09:24AM +0100, Alexandru Hossu wrote:
> Fix a multi-line block comment to follow kernel coding style.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
> v2:
>   - Add missing commit description.
> 
>  drivers/staging/nvec/nvec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08..0e655f79e 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  			to_send = nvec->tx->data[0];
>  			nvec->tx->pos = 1;
>  			/* delay ACK due to AP20 HW Bug
> -			   do not replace by usleep_range */
> +			 * do not replace by usleep_range
> +			 */
>  			udelay(33);
>  		} else if (status == (I2C_SL_IRQ)) {
>  			nvec->rx->data[1] = received;
> -- 
> 2.43.0
> 

Does not apply to my tree :(
