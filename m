Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAEF1A9FAF;
	Sat,  7 Feb 2026 00:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770423908; cv=none; b=kwcqWHosu+mhK1s5uYb3Qmk2Ep8PHu0Hqyc/fYJR7+ow31o35vYp1VWUspPd84k7o25hZxRzUWS6eq1wuez3ROJsgJ2E02yUP5h7lvHi8jOgpmLS/iBStzv5hYMPqaQT9l5CiMh3KZTCJdaqmL1WrTLzItpd2P2W1TPPW44j7DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770423908; c=relaxed/simple;
	bh=zYYxKFnZyYEH3uCFrpo0qi379mFV65SSz1bC/MscBJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hsq7SOv56YYW1vk4d6Awef7uyB6o+EDpTpkh39Xm9vO5GnPOH1M7Fv7PIAUkJSpDr9MHG/ixID0Hdp0awKSXOa9Hb3+N92PqK4Kf7Y5HB0YdK9cyey9RsA02tOxvhqrF6eu49p4rMmiYZkcf69BVuhTwS212F3buAakU8fCAqMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVKDxf8Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVKDxf8Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665D1C116C6;
	Sat,  7 Feb 2026 00:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770423907;
	bh=zYYxKFnZyYEH3uCFrpo0qi379mFV65SSz1bC/MscBJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVKDxf8Yi4zjpKifVBxCe50qr1giQZcCtPndj1sqGH38/9E1fvxJT8FenQopfhpYa
	 kLGN7gBHVmLOaxiCv8VKniTu5b0jAEChxCJL57++AypG5KnaL3Cbmr+cS1TD9E5tqC
	 Ex25CcT9IJ4AUpfabqf6iAaJkslEvzCpS5BOEmNkM/EKOZ1C90Z8l/wpRr+U8fHqic
	 n7jkPS5Sd8hY7/Zn6XbA2zQH4ZyEf7AV9ubeoP79+dFxtyK3GOoj1+5Y2NL8GkmuV2
	 Vb/lQsfOyCWKv5roZlXohPl5ny2gvGuY1puu9MdkRvLdx2JZfM07MIN1xynlB7Dp5q
	 cZ7nAD+DFmkDQ==
Date: Sat, 7 Feb 2026 01:25:02 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Don't mark devices with pins as IRQ safe
Message-ID: <aYaFv81tlNHY4a0n@zenone.zhora.eu>
References: <20260202-i2c-dpaux-irqsafe-v1-1-5b1847e8bc97@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-i2c-dpaux-irqsafe-v1-1-5b1847e8bc97@nvidia.com>

Hi Mikko,

> -	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev))
> +	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev) && !i2c_dev->dev->pins)

I'm sorry, I had to remove your patch. The ->pins member is
conditional to CONFIG_PINCTRL, without it we get this compile
error:

   drivers/i2c/busses/i2c-tegra.c: In function 'tegra_i2c_probe':
>> drivers/i2c/busses/i2c-tegra.c:1842:82: error: 'struct device' has no member named 'pins'
    1842 |         if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev) && !i2c_dev->dev->pins)
         |                                                                                  ^~

Please fix it and resubmit a v2.

Thanks,
Andi
