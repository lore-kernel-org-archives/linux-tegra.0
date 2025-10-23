Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1757127603A
	for <linux-tegra@vger.kernel.org>; Thu, 23 Oct 2025 06:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761199971; cv=none; b=utxuNrlxZjnOAr5ZYsnXAwhoUYkhg+IfGGiPzasBuMFsiFs+w9lKxDB9N3+IUKX/seQIJGVCl1jHsbzfvcqI7vUvZ8OC6msR0JkvNR1+1aphpRpfmoc4ZVqkqywE9C9uDnnGMPhHAgPZJTK0MwjvU04qm/zC2GHZZm/sGGpAZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761199971; c=relaxed/simple;
	bh=0qtpy478yofG/xxh3MDnfPaQpXyLssV/fJeryEkVQ8M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDelYmfBD1KRpkVzEz7pepd9CKxBxYJYhTl+4MRUVaR5FieKf+uYKT4q5M5AnP2pK/ZJV0DZBmKLX3SEtFSiXYFdfHUTq+Rjtn3kbUxnS4+ibMKURIftBy/uri/+sDg04QtXc5ANQuXCZ7HRrfuXX98EI3nwV70mHcu9e5HYNec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rTenhLUe; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rTenhLUe"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 11E12C0C407;
	Thu, 23 Oct 2025 06:12:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEF65606DE;
	Thu, 23 Oct 2025 06:12:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F63C102F2448;
	Thu, 23 Oct 2025 08:12:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761199963; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IDoZQPfJ2uvBwkI3w7inoYDmy42TemZU+nfSiuOSXQI=;
	b=rTenhLUezi4UIBEX6O20SQhq/q3x7G7YgGjWRrWFnckKwcHm3nWV82Xv0xtAqNlunQld68
	brPMSVZna6oe9+wjqXNufdkw9Zn6gdvL/MctlGXJrQdRL0tkFuXooVwaakSY0cDSmXlZyF
	4i/B8v43fANHdgjSxmgKPTYvkFQaCvLPw0KGT6EHPXUI3pJ9VvgwuWJ4rKfyiTXhvfHsvo
	RoRyv9ZiZVmvTm55RS0WBlWOj+Twc4vQCV3vYpi6DxHmqia0SSvDg9I6LiTxJQzdHvY2c1
	RdhSYkUVROwBN3lz9tBnoiBRZHl041VjZGTZ/UjD9wtSem8e2dYhHparKDjOHA==
Date: Thu, 23 Oct 2025 08:12:32 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Bruno Sobreira =?UTF-8?B?RnJhbsOnYQ==?= <brunofrancadevsec@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc/tegra: Resolve a spelling error in the
 tegra194-cbb.c
Message-ID: <20251023081232.272d7752@bootlin.com>
In-Reply-To: <20251022174531.1751-1-brunofrancadevsec@gmail.com>
References: <20251022174531.1751-1-brunofrancadevsec@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Bruno,

On Wed, 22 Oct 2025 17:45:24 +0000
Bruno Sobreira França <brunofrancadevsec@gmail.com> wrote:

> Hi, this commit resolves a spelling error in the tegra194-cbb.c.
> 
> Signed-off-by: Bruno Sobreira França <brunofrancadevsec@gmail.com>
> ---
> Changes in v2
>   - Really fix the spelling error
> ---
>  drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
> index 846b17ffc2f9..e1deda188fdb 100644
> --- a/drivers/soc/tegra/cbb/tegra194-cbb.c
> +++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
> @@ -1836,7 +1836,7 @@ print_errlog1_2(struct seq_file *file, struct tegra194_cbb *cbb,
>  }
>  
>  /*
> - * Print transcation type, error code and description from ErrLog0 for all
> + * Print transaction type, error code and description from ErrLog0 for all
>   * errors. For NOC slave errors, all relevant error info is printed using
>   * ErrLog0 only. But additional information is printed for errors from
>   * APB slaves because for them:

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
