Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFED2134CC;
	Sun, 21 Apr 2024 11:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713697993; cv=none; b=leVMQgjAB7Z0E8PErg2MYbAhvlBest9lTH+lU1ZZYi8L9HpyT6l6/saf+OC3CADc/pijMaKpmUZZ/187FcYipSbyh3IjV2YOfF6RokB3YRwtyrxADZzzuVTjByYYkz7RSVR7mHbAxbrpdZ4/tzmoDc4N8qAlWq9eI87GRAUZJfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713697993; c=relaxed/simple;
	bh=EvI8i/YTPQImOHFz+LhFjd/EPxQLJiMv9vlIwI/2X3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6Y3cdEqZyFZTkWCTB2cmJDdorGPVqpWxCvRKGBlXrGybUTm9US5c7j1KnJJ+QBOMjxiPA6wDl4EeL9v5Tg9Tn90Tx+gsurF4eQwHjPz2D4jFpsSSWKeQGx0YnES2ZzSygrh1yNXJhTfJ0ImYL+UedZ1koPoUHXx2sljjjyxZ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UUVJBCKs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UUVJBCKs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED71EC4AF08;
	Sun, 21 Apr 2024 11:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713697992;
	bh=EvI8i/YTPQImOHFz+LhFjd/EPxQLJiMv9vlIwI/2X3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UUVJBCKs/6HF7P5nWMVHp4KWZhbsg8OA8VQtf4NWZ1abFPd46VvT2mGTkPzs4qGV3
	 3pEPUxk+doyvyDDYCNDiyy3RNVXNozdqsDu6ymXnnR/nK4WGwzK10VS0PowXcQ4cUW
	 +J1HNdVIJTTe6iBeM6ZphAhAkyj5Jg3VdTIpiBBU=
Date: Sun, 21 Apr 2024 13:13:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: make i2c controller register writes robust
Message-ID: <2024042118-errant-causing-8bc5@gregkh>
References: <20240421104642.25417-1-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240421104642.25417-1-marvin24@gmx.de>

On Sun, Apr 21, 2024 at 12:46:42PM +0200, Marc Dietrich wrote:
> The i2c controller needs to read back the data written to its registers.
> This way we can avoid the long delay in the interrupt handler.
> 
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
>  drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 45df190c2f94..214839f51048 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -570,6 +570,22 @@ static void nvec_tx_set(struct nvec_chip *nvec)
>  		(uint)nvec->tx->size, nvec->tx->data[1]);
>  }
> 
> +/**
> + * i2c_writel - safely write to an I2C client controller register
> + * @val: value to be written
> + * @reg: register to write to
> + *
> + * A write to an I2C controller register needs to be read back to make sure
> + * that the value has arrived.
> + */
> +static void i2c_writel(u32 val, void *reg)
> +{
> +	writel_relaxed(val, reg);
> +
> +	/* read back register to make sure that register writes completed */
> +	readl_relaxed(reg);

Do you need to compare the value to make sure it happened properly?

And how is this an i2c write?  Normally that implies this is using the
i2c core functions, this name is going to get confusing very quickly...

thanks,

greg k-h
