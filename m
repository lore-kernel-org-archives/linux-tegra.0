Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1DB4CC29C;
	Mon, 12 Oct 2026 20:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791837961; cv=none; b=fictdWwq680nwoyKIhWn0RQ1Jz/qXYxto7/fwz8K+9gu5XdWIDlTlvENXhNCTuNim7adm//GXu5V4JytdGe+wdZcHFNirGNb9cTOdc+26Wj/0iOhZo9aWjYSP3ug0Jncmdg5aZvls2WtM8/D4v6Nf59GVeJT3SwFCBOqU2ekwLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791837961; c=relaxed/simple;
	bh=UH3cbq3ml4jimezvZ3Mh+yJx7fJ0JsfGMGnLKd514DQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DoG4SSD3pbUXbcbAPBLxycYOA+bestevgTpKTfBYHiQDdmClaXW1VHSukJs2zWMgc4v0Lssqr/Cj5zd/OGcQJ+eRWm7Ez1o6+UHuB6pgZjd5TRO3YgCw53deDWmtPsUxp1PSIVYjoOLKlib/1ofhKo8n+pZuX5HxHm3t8aDxMAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=RO9m1tKQ; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="RO9m1tKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PE9aaz1f8WNw33OXbxxphrNcE9ceVoU6+8hsLajxbHQ=;
  b=RO9m1tKQPzEubLUHexNabXgVn6Z1cIpGBOAIGM3tHwviGfJ/lOKZ/5V8
   OixtOm+sexS9gKCZm7m48P9iJOhZ7yuKnZC1r1xgYVLXwagsjCbAyJLmD
   TtNEjpp3/iXKoPTwCVYGecvnCjl9vaB4IXiURY4dZ6HOUoMnhEhrtgBm9
   o=;
X-CSE-ConnectionGUID: ngCFrpB8RxSekRMBqaidVQ==
X-CSE-MsgGUID: DelHkQCqTReLioT1q8Tjsg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,154,1787004000"; 
   d="scan'208";a="299823727"
Received: from unknown (HELO hadrien) ([12.202.65.58])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 22:45:42 +0200
Date: Mon, 12 Oct 2026 16:45:41 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Jeremy Dean Clifton <deaner92@yahoo.com>
cc: Marc Dietrich <marvin24@gmx.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net, 
    linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: nvec: use guard(mutex) in nvec_write_sync()
In-Reply-To: <20261012171312.5998-1-deaner92@yahoo.com>
Message-ID: <b51c3755-a967-3de3-5f8c-3e4984d6e93c@inria.fr>
References: <20261012171312.5998-1-deaner92.ref@yahoo.com> <20261012171312.5998-1-deaner92@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 12 Oct 2026, Jeremy Dean Clifton wrote:

> Use guard(mutex) for sync_write_mutex. The lock is released
> automatically on every return path.

The second sentence seems ambiguous to me.  Is this the motivation for
doing the patch or the result of the patch.

> This removes the three
> mutex_unlock() calls and simplifies the -ENOMEM error path.
>
> No functional change.
>
> Assisted-by: LLM

For Outreachy, I would encourage you to do the work by hand.  You are
welcome to check the work with an LLM.  The goal in the application period
is to learn how the patch submission process works, not necessarily to do
it as fast as possible.

Feel free to introduce yourself on the list as well.

julia

> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
> ---
>  drivers/staging/nvec/nvec.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 41cbdfdc1da6..716b1b482568 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -298,17 +298,15 @@ int nvec_write_sync(struct nvec_chip *nvec,
>  		    const unsigned char *data, short size,
>  		    struct nvec_msg **msg)
>  {
> -	mutex_lock(&nvec->sync_write_mutex);
> +	guard(mutex)(&nvec->sync_write_mutex);
>
>  	if (msg)
>  		*msg = NULL;
>
>  	nvec->sync_write_pending = (data[1] << 8) + data[0];
>
> -	if (nvec_write_async(nvec, data, size) < 0) {
> -		mutex_unlock(&nvec->sync_write_mutex);
> +	if (nvec_write_async(nvec, data, size) < 0)
>  		return -ENOMEM;
> -	}
>
>  	dev_dbg(nvec->dev, "nvec_sync_write: 0x%04x\n",
>  		nvec->sync_write_pending);
> @@ -316,7 +314,6 @@ int nvec_write_sync(struct nvec_chip *nvec,
>  					  msecs_to_jiffies(2000)))) {
>  		dev_warn(nvec->dev,
>  			 "Timeout waiting for sync write to complete\n");
> -		mutex_unlock(&nvec->sync_write_mutex);
>  		return -ETIMEDOUT;
>  	}
>
> @@ -327,8 +324,6 @@ int nvec_write_sync(struct nvec_chip *nvec,
>  	else
>  		nvec_msg_free(nvec, nvec->last_sync_msg);
>
> -	mutex_unlock(&nvec->sync_write_mutex);
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL(nvec_write_sync);
> --
> 2.43.0
>
>
>
