Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449206;
	b=EFHCxPaJYQR/crMcwWo0jg+3Gm4wGq0ddjhMqq3/cPVyLLvPyQsM602C628Xurv9gmI9
	 1Zq5bn3J9jLggosu33iqu4b9rWYN/Z7LK4n265gIgSJxUcTcho4NU5sT983MAmNmrQhH4
	 axeZEVtsc087PgayixGqPWFRkQWB6S/fbcV2IAiS+AZ6wgyiNKGlB5ent2Dv8fjtqZ9yf
	 yW27xzlx1F5Bw94RMwpod5sF48sA5VnM7tK846+C+E7W+VSF43hKxVo7MEHj9IAfosyZO
	 iLqR1eKU2HcZs+9vZnegGh37eSu+uVeRKQofDZ0oAJOi/Y3asoEfo2oO8wU8XdZQFAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449206;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aC+ozKo1SQbQOnribQKSECUAZggGyzBm59lqVF1tIOo=;
	b=lOQ+/Lqxnnt50jiX0eyXNZxMFGUWUrf0esMOA2XKJbJFmICyPX5FYw8EcxXLmSXrCmwR
	 IYxEwePEqPYSBTjNt+0LYKit2sOSNF+Q/+4bYvtELJtOOHKYZGrhjsX4anI3SCL++og/j
	 /jEDW1ozRC8eJLCwW7x0bGwhzMxZ+7yZbCYb8vgevh4oDme/HXP2d/S8q8KxK+0UNnVZW
	 nAe3Gmwo1kNGgllj3Cc0aVKpAOuCEqoro8JflOnNMZNX460bALQKrzMDyupyRxuTRSEi9
	 qrgAJDfwEhy+HO8E7WqR1hmv4jhsryjajVPw4ZCIyv077apxhi0JxvNWLmNeeqrRiog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wn0m+C6a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD5B606A31A;
	Sat, 31 Oct 2026 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wn0m+C6a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDB71F000C1;
	Sat, 31 Oct 2026 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793449205;
	bh=aC+ozKo1SQbQOnribQKSECUAZggGyzBm59lqVF1tIOo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Wn0m+C6aMhE7uVoLV2BVwEXr+GHb38ZUaXinLEPRHFjG/lnjQ4dZFfvtXyfCQHfXp
	 arVihC/zaPmkiH8hP1jnUxkrPr5rGStFGsxynFP+TTFv4cmbi+Uwuut5uBV4jMLHEh
	 NTqT6IPj59AKleG0mNw6RlcKjGxZyRp6YNiceiHqxApEewYwehiPUvI311yRk4kw3c
	 3LHhOByqcEl1TuvG3Xd0hvif0T7ojAFTcNzvh10ml0rx+omja63LWaR26hvTUEkKUA
	 VkIL0ZxUE84tc/WGjb8jgUGnIZf3U9OTP508kby+amxpI/TYG+BfL6xUEFCAeDeDYg
	 amOFwVYUc+MkQ==
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: tegra: Clean-up Makefile for Tegra186
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>, 
 linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261012-tegra-phy-v1-1-3241bf3c86e9@nvidia.com>
References: <20261012-tegra-phy-v1-1-3241bf3c86e9@nvidia.com>
Date: Sat, 31 Oct 2026 17:49:41 +0530
Message-Id: <179344918143.5901.8981385742603582219.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=579; i=mani@kernel.org;
 h=from:subject:message-id; bh=UKIJFkSajcdCYHAY1RJJ/pyc1TD2FQZP6j6DLPWaSzg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5dztue46volUCrz/xKgQVfRbKUG7RKrz8ThIo
 ZMvs92iuOuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauXc7QAKCRBVnxHm/pHO
 9aShB/9p3OuLoAMX0st+401EKD1UTkEvFE7RWcx6prtgkrGWqavJs+4/D6GcqNrGO0e3SRaj5cw
 YqYzxgHPkPzBiehtRMCtq/37PwhGBufQnjTEhkm/io6AlAIdQdSrTZtx7y7X5h5XWm+JYbr3Xkq
 tQZo2f3oW9uoU6FHRe15XRmj2Qumi/Cs69Re7WPSHUSBjEZmNOeRLC5YEIxssPyLEb1+Be1W0we
 s7Fj2u9KayL+XrA/S6RWQesK/6ocMQgnnwimE87+vue2AGP6bntZKatqYUe1yXPP22OdtVzaSu+
 7zw70ZnUcxptzeeZf0tMfWuuWdtZ7VBywVuwFn6lX8uh4K1n
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-12 12:16 +0100, Jon Hunter wrote:
> The Makefile for the Tegra XUSB PHY driver has an entry for every Tegra
> SoC that compiles the xusb-tegra186.c file. Clean this up by adding a
> new Kconfig option called PHY_TEGRA186_XUSB that when defined compiles
> the xusb-tegra186.c file.
> 
> Finally, update the xusb.[ch] files to use this new config option as
> well instead of using the individual SoC Kconfig options.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


