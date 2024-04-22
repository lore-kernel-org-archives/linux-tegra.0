Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EFA1448E5;
	Mon, 22 Apr 2024 11:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713787042; cv=none; b=ZNe6nd85vvCGivkIxtUctOfr2rU+rZ/agVG2i9EwtOvWJEEfUOM/TWtGBHy809tJ1v4XJRm96hHJCBDQmsTBkvnCJkODU6nU+7j9K2ikAJmWzB6z0BYfaj3cnIbWWw0SNFt43zZ1CFCbKEedQf5t808BtKzdiRvWCSUOqriYATs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713787042; c=relaxed/simple;
	bh=iXdnGV0GNbWvOOMay2HuTzIgDnAqwDf0+4xcJRVN9IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGBXeKsQ8wk8J5G87dR3ao0NnHx6ksX7oH93QIc2F99X/9pQmiOQ+sP7B17rX1lZxIU98dDp8bae/ts3W+dejZxP11bR1My0B+rSUCsK8pkpNjH6aMLyzDRgUYiW89IdwC03nMuTjkG6KJS8IDKiP38rE4ehC+mZ1ruhgH9rQx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=oBsn/oRs; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="oBsn/oRs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yitCqMx2a0fEw609oprUCvQiXhu4oVn7HyKwI2mxpJI=; b=oBsn/oRsEAPpByPdsGDnh0cK9o
	jDYNwe2mOX7XCP9EJ6XNf3c8NiVxXKgnIuCm3MSfnbYcOHL+Y9LGk7HQocExZnQUYauNEDRTSTwFz
	4Ezbq3y+YjrehaosF8fGOJrj0lQIup88dcX+YtTTvc0rMhOkGJsBvAyWJBGfewy+jsvn9z+4Zd6Dx
	rg10Mg4Dc2QXjGYHGvtF4yo5Cc4x7ERufiLIf0ER2XbHrNaNC3rXTe4k6eZy8rIRQJRSwbrGqZ7Mu
	FsARF8pXMtEXgm39At5IkRSpX/oNKjY/38RApM+NziulHCuRohdBr0NvK8Gf2M35UXJhYqhVqD4VH
	HareYbmA==;
Received: from [167.98.27.226] (helo=[10.35.6.244])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1ryrrD-00C7xA-Ef; Mon, 22 Apr 2024 12:29:11 +0100
Message-ID: <2338e58b-1ec2-4500-9675-2d8a3aaa107f@codethink.co.uk>
Date: Mon, 22 Apr 2024 12:29:10 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: nvec: make i2c controller register writes robust
Content-Language: en-GB
To: Marc Dietrich <marvin24@gmx.de>, linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org, gregkh@linuxfoundation.org
References: <20240421104642.25417-1-marvin24@gmx.de>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20240421104642.25417-1-marvin24@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 21/04/2024 11:46, Marc Dietrich wrote:
> The i2c controller needs to read back the data written to its registers.
> This way we can avoid the long delay in the interrupt handler.
> 
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
>   drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++---------------
>   1 file changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 45df190c2f94..214839f51048 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -570,6 +570,22 @@ static void nvec_tx_set(struct nvec_chip *nvec)
>   		(uint)nvec->tx->size, nvec->tx->data[1]);
>   }
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
> +}

I thought the default behaviour of writel() should be to force writes
out of any CPU buffers. Are there any bus isuses here causing the code
to be necessary (and if so, why is there another buffer breaking the
writel behaviour?)

>   /**
>    * nvec_interrupt - Interrupt handler
>    * @irq: The IRQ
> @@ -604,7 +620,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>   	if ((status & RNW) == 0) {
>   		received = readl(nvec->base + I2C_SL_RCVD);
>   		if (status & RCVD)
> -			writel(0, nvec->base + I2C_SL_RCVD);
> +			i2c_writel(0, nvec->base + I2C_SL_RCVD);
>   	}
> 
>   	if (status == (I2C_SL_IRQ | RCVD))
> @@ -696,7 +712,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
> 
>   	/* Send data if requested, but not on end of transmission */
>   	if ((status & (RNW | END_TRANS)) == RNW)
> -		writel(to_send, nvec->base + I2C_SL_RCVD);
> +		i2c_writel(to_send, nvec->base + I2C_SL_RCVD);
> 
>   	/* If we have send the first byte */
>   	if (status == (I2C_SL_IRQ | RNW | RCVD))
> @@ -713,15 +729,6 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>   		status & RCVD ? " RCVD" : "",
>   		status & RNW ? " RNW" : "");
> 
> -	/*
> -	 * TODO: replace the udelay with a read back after each writel above
> -	 * in order to work around a hardware issue, see i2c-tegra.c
> -	 *
> -	 * Unfortunately, this change causes an initialisation issue with the
> -	 * touchpad, which needs to be fixed first.
> -	 */
> -	udelay(100);
> -
>   	return IRQ_HANDLED;
>   }
> 
> @@ -737,15 +744,15 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
> 
>   	val = I2C_CNFG_NEW_MASTER_SFM | I2C_CNFG_PACKET_MODE_EN |
>   	    (0x2 << I2C_CNFG_DEBOUNCE_CNT_SHIFT);
> -	writel(val, nvec->base + I2C_CNFG);
> +	i2c_writel(val, nvec->base + I2C_CNFG);
> 
>   	clk_set_rate(nvec->i2c_clk, 8 * 80000);
> 
> -	writel(I2C_SL_NEWSL, nvec->base + I2C_SL_CNFG);
> -	writel(0x1E, nvec->base + I2C_SL_DELAY_COUNT);
> +	i2c_writel(I2C_SL_NEWSL, nvec->base + I2C_SL_CNFG);
> +	i2c_writel(0x1E, nvec->base + I2C_SL_DELAY_COUNT);
> 
> -	writel(nvec->i2c_addr >> 1, nvec->base + I2C_SL_ADDR1);
> -	writel(0, nvec->base + I2C_SL_ADDR2);
> +	i2c_writel(nvec->i2c_addr >> 1, nvec->base + I2C_SL_ADDR1);
> +	i2c_writel(0, nvec->base + I2C_SL_ADDR2);
> 
>   	enable_irq(nvec->irq);
>   }
> @@ -754,7 +761,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
>   static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
>   {
>   	disable_irq(nvec->irq);
> -	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
> +	i2c_writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
>   	clk_disable_unprepare(nvec->i2c_clk);
>   }
>   #endif
> --
> 2.43.0
> 
> 
> 

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

