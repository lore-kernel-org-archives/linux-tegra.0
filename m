Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A0C3126AD;
	Tue, 15 Sep 2026 07:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456127; cv=none; b=vF8Z+IllrNp0XGCm4m32OpSA+ZF6MA8DyRZdwEKf9ACI6jWqpdWb3tPRk3cem3ljvOAkrndS+untiLz0VJec5iFFCNg3LO8lxofujG6zo/thB2VJ3g770Q7MgoDc7CDjyB1iY4UpK7D8in6mz4F39S04VRwjwKPsGfQowu5Q+To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456127; c=relaxed/simple;
	bh=iUxUSUt+SdyG7T8SxpfhJLcZS48K6HH1JYNBgBo0uII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ojRKy9oHQ5MaIFEC2lVK91RADddfVTSx/ezY97PwGHuZGS0Tm3ekDk/oL4jHiys+iVl5WaoD6CJnoe/+U8CxaIStQhtzRluhIFBFDAsVuNfsB5BI0q7As54J6REfZsUJAX5R9hIUQr/1RrSr/bifWTOpeLtf8wwMGvO36vM2zRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9rbETPo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9rbETPo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482271F00893;
	Tue, 15 Sep 2026 07:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789456121;
	bh=FZ4sOFzqh5v1KYNfvbErrDbhS9mXlIlU3yLYc4mNmzg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e9rbETPo5oF+GJamUSAO1PMQlaV19jPJ98hzcGlSngUyxCSZ+/jAYmeYiVzGbi+Nk
	 V+UaDOsYDXk6cKmZZ+j3K2QEifswV+3txtPPukBBSFouCyyiOeQMlzrDMmSYQN9IG3
	 tJrXg+/Kq73+bsO4gG9T5idRiDkMJeCAa7mhDjjsVsDaVl5ne6fsDRIYG3QauLqOIi
	 2KLwKvnTLufDC+1C955AMMw5wravYu6nSuNEnrwBhLuwQ7zXimvxY7dKMO7rI9u5ET
	 9VUB7hc3eJk3895zfIm5Rr3Y4CdAo0uDdC9TUjv0RFOOqBCFHtuFyvCBzic0m8tCQf
	 iT+8zZmStXp3w==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: thierry.reding@kernel.org, jonathanh@nvidia.com, 
 Ketan Patil <ketanp@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20260903182520.950555-1-ketanp@nvidia.com>
References: <20260903182520.950555-1-ketanp@nvidia.com>
Subject: Re: [PATCH 0/3] memory: tegra: Refactor Tegra264 mc-err code
Message-Id: <178945611901.44219.2006628780238670109.b4-ty@b4>
Date: Tue, 15 Sep 2026 09:08:39 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Thu, 03 Sep 2026 18:25:17 +0000, Ketan Patil wrote:
> The MC and HUB error-logging paths on Tegra264 used large switch
> statements that interleaved register offsets, bit positions and
> decoding parameters for each error type, which made them hard to read
> and review. This patchset refactors these paths without intending any
> functional change to error decoding behavior.
> 
> Ketan Patil (3):
>   memory: tegra: Use named defines for Tegra264 MC apertures
>   memory: tegra: Parameterise Tegra264 MCF slice bound
>   memory: tegra: Refactor Tegra264 mc-err code
> 
> [...]

Applied, thanks!

[1/3] memory: tegra: Use named defines for Tegra264 MC apertures
      https://git.kernel.org/krzk/linux-mem-ctrl/c/edda28d5317521c2f5172f869d3a433a2d37f7a2
[2/3] memory: tegra: Parameterise Tegra264 MCF slice bound
      https://git.kernel.org/krzk/linux-mem-ctrl/c/fb8af372f899690646444cd0b38a88ec52568cbc
[3/3] memory: tegra: Refactor Tegra264 mc-err code
      https://git.kernel.org/krzk/linux-mem-ctrl/c/f4e16143420f4021431cc652ebd71e176267ecbc

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

