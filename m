Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159354;
	b=KaJfji8TNV64zM0o53sdnwmhzWqS/jEZ2pQYkGRk3BZAElG6wTg1I//a7hsdSzTjrkt0
	 Q1sktNfxV9UljgbPeQGdsgal5A9ZXG1xLCblNEEMDV6AT2oXjQf4NRsFZYKcFM8Nn31vJ
	 gTBUZBSrGNlY8DXsnIFJaewoPpXl3h2xgUaBaEukqFRQuyy5w+DOueQtTtUexwqc0egFx
	 t32w+tg0tJz1vmpC19KW730hzAbdJHrE2gaxa+rVFO9evFe5rxg6oa/8LA5GvZIKRH2Su
	 FUn35K/rUC2VW+KohrKZqpfaqssVaVOIW8EI8gTeLkZAMbF9uP+N9/Nd4gq5vbwcDEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159354;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YlwSi1S/DD/HuB/30gPmO1KjKfTCKaqLwfDfcfcFtPY=;
	b=fTJOwX1Yh6rXUA+3h9yakETvgg2fE6/Rjtqn4I1d20YSEWHjlhYqcYXfbkGOizEY6RV5
	 WVAIRYOGiq2CaqvHtcccAr+tiCy5FxsVmGqYizQC060Ggf7Ws7Ht6PQWXd+YZ7YEBx5/x
	 p6PQ44CIJX26u9605GgiHyp7qL+BVNH5dv7O4B7RRfBjAxnFPFkpOZZBq9g5l9YXb4uRa
	 DA5Fk2OgALAVu7v9zfacr8Hs2/brkf2soGaD+4oM/ipgYSJMEJLJFAQqi8EHyc0vcBUw+
	 nVsgg9KO3MPT5K1jZ5zXMjcvBL6sm1xJ4rzZB6EuXnE/u18RQs3f+pz8l9uBWqRl8iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=IbR3v5Ga;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1BC606A333;
	Fri, 20 Nov 2026 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=IbR3v5Ga
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708131F000C6;
	Fri, 20 Nov 2026 07:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795159354;
	bh=YlwSi1S/DD/HuB/30gPmO1KjKfTCKaqLwfDfcfcFtPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IbR3v5GaPjWCq+7axP+j+jGdBsDJJL6mPv7FOnjwONM+xSSciJNL3RSzzvK5kllBR
	 Q/VBLmpOkAREj6OeLtnCkNIoqKmkIpbHi1TcsMnRZGjln4DQ71PnE409yyubBvkXvf
	 TGfUZ1/Uhozk9T+4U9AFe5xReY//c4e7cBhjiIpg=
Date: Fri, 20 Nov 2026 08:22:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, ac100@lists.launchpad.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: kbd: bound keycode table lookups
Message-ID: <2026112023-visiting-gravity-2945@gregkh>
References: <20261111230134.200561-1-benazzaanis783@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111230134.200561-1-benazzaanis783@gmail.com>

On Thu, Nov 12, 2026 at 01:01:34AM +0200, Mohamed Anis Ben Azza wrote:
> nvec_keys_notifier() indexes code_tabs[_size][code] using values taken
> directly from the embedded controller's event message without checking
> them against the tables:
> 
>  - _size is a 2-bit field (0..3) from the message header, but code_tabs[]
>    only has entries for NVEC_2BYTES and NVEC_3BYTES. NVEC_VAR_SIZE is
>    rejected, but the reserved encoding 3 is not, so code_tabs[3] reads a
>    pointer past the end of the array and then dereferences it.
> 
>  - code is msg[1] & 0x7f (0..127), but code_tab_102us[] has only 126
>    entries and extcode_tab_us102[] only 110, so scancodes at or above
>    those sizes read past the end of the tables.
> 
> Reject any size encoding without a table and any scancode beyond the
> end of the selected table, dropping the event as is already done for
> the power button.
> 
> This only matters for an EC that sends malformed or out-of-spec
> events, so it is a robustness fix rather than a security issue.
> 
> The issue was found and the fix drafted with the help of an AI coding
> assistant (Claude). It was compile-tested with
> ARCH=arm LLVM=1 tegra_defconfig + MFD_NVEC/KEYBOARD_NVEC at W=1 with no
> new warnings, and the lookup logic was exercised in a userspace harness
> under AddressSanitizer for all 4 size encodings x 256 scancodes: the old
> code reports a global-buffer-overflow, the new code none. It has not
> been tested on real Tegra/AC100 hardware.
> 
> Fixes: 32890b983086 ("Staging: initial version of the nvec driver")
> Signed-off-by: Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
> ---
>  drivers/staging/nvec/nvec_kbd.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Please read:
	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
