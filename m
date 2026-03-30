Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1397344DB5;
	Mon, 30 Mar 2026 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885901; cv=none; b=Apz15DYAyJqM2AW9dyvaw3ZKnCbJIm7mSARe1HmtUvno4A3Dj0BnnO9Oiku6BlmNEYI66I47vHdD8yDKyx0kUjeZMAyyqVkL6vlWenkLtuGwX5W0P3yJH85DmBkCq5n4GRKn7lzEdtLLjAHOHN/QYtzJxdoaKkEUJNR4waJzohw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885901; c=relaxed/simple;
	bh=VjZpJN9SN3Cbv+q/GHgyVTPouO/S00Aq2D+4UhnLGVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ1ay4xiFnzPEqNyYVnG7QNgE0RKDzij9GwzNls88A2pQJplM5cujYkA4o5D8zdjA5nPxKZuSLSwpUC2+1MHqMhI4YgV4NmyuMqnsJkxyxWUDluvXEWPziTO5QoabGnCkoq9F6m3PmsGSiLdVgWjMg3JSeLio8W+09qHpNHZ8g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uD/HkKGv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uD/HkKGv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D81C4CEF7;
	Mon, 30 Mar 2026 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774885901;
	bh=VjZpJN9SN3Cbv+q/GHgyVTPouO/S00Aq2D+4UhnLGVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uD/HkKGvpDvOk7tq5zKCA9l93yF85/7C69IQjnL5GJv2lbUkKg3LkpskN/rSvYyyZ
	 rmMvd935vGVOB2+5simP+7qOeU5KYY+qhGnKB2/hTnRPLoRfXGwaaKWxoOZUkMAC9K
	 SbjBGLgzAUDn+sEjprm6Zrf+Po5W5cEGQFUeFnG8=
Date: Mon, 30 Mar 2026 17:51:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
Cc: marvin24@gmx.de, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] staging: nvec: validate battery response length
 before memcpy
Message-ID: <2026033041-elf-coach-5fae@gregkh>
References: <20260330125200.820693-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330125200.820693-1-sebasjosue84@gmail.com>

On Mon, Mar 30, 2026 at 06:52:00AM -0600, Sebastian Josue Alba Vives wrote:
> From: Sebastián Alba Vives <sebasjosue84@gmail.com>
> 
> In nvec_power_notifier(), the response length from the embedded
> controller is used directly as the size argument to memcpy() when
> copying battery manufacturer, model, and type strings. The
> destination buffers (bat_manu, bat_model, bat_type) are fixed at
> 30 bytes, but res->length is a u8 that can be up to 255, allowing
> a heap buffer overflow.

How can the embedded controller send data that is not correct?  It is
trusted, right?

> Additionally, if res->length is less than 2, the subtraction
> res->length - 2 wraps around as an unsigned value, resulting in a
> large copy that corrupts kernel heap memory.
> 
> Introduce NVEC_BAT_STRING_SIZE to replace the hardcoded buffer
> size, store res->length - 2 in a local copy_len variable for
> clarity, and add bounds checks before each memcpy to ensure the
> copy length does not exceed the destination buffer and that
> res->length is at least 2 to prevent unsigned integer underflow.

Is this the only data that needs to be validated from the controller?

> Reported-by: kernel test robot <lkp@intel.com>

The kernel test robot did not report these buffer size issues :(

thanks,

greg k-h
