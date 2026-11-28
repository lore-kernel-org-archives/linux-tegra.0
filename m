Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795854689;
	b=w4R9wMXMtREt5CD30Dir3ICculmrrtMtnPx4PKdIHXyvI4lNY+285vE0myN0dG0Dm6DK
	 St61yvdeyflABTIQCuw4TIz/ouognAvmuYtPRo8IewbyXKvUROFSKcOk7gF6ngBmcIRV3
	 YeCIgTKPikCUqoaQ+/b2/UQWMy91AnxCglZpVKFcRWOQSfaVKuUv+ClnxYOQk14WoG7u7
	 jRLKZHC187sBXaRF9lr3qSnZBTUUx6+NGmhwhLPbdhKRFPxbCO6oE10+AtytdtXbck6yH
	 eI54HIq4R/TSAp3ifsNTpMtgFNf+ElZqirazRxBqIQiD8kSLy53yzL08ApgiKTZswMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795854689;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2PRJhrxEiMj8DGY7aal2VC8ZsNrTCMwpNJd8RYsAFwk=;
	b=hMbZ+3oNLqIaRTEPXQ+fPA+qcs7+YtsvpUIa8GbVtMz4MkydEPe1WwcETIA2uZpnuAP3
	 2HrMvnoJC4IkXiKOj2g8gqH0if6e7A1NfbUhZ+llzd0jORdiiKQh+/5Hxki+Q56/umuzB
	 HuddOpfZCMVoU7WsimOA4Ai+eUfDPzR7A4qtJpi4FtLkgYrevGJvDC65zmzpM51wZFE05
	 mNfw5lj9g5E3cWtOz5EW/i0orXf35UJJLsMIrmTlFGemGlwetcs16gf3oIzFG3sea5Nyl
	 EBO7HFjTuCqX6IWylghWEV1VHdJJ2XlWAZ4hvvsXjaF//LBq7zsta9ze9auTpl0VKoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6kHhgvB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126CD606A31F;
	Sat, 28 Nov 2026 08:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6kHhgvB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103471F00898;
	Sat, 28 Nov 2026 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795854688;
	bh=2PRJhrxEiMj8DGY7aal2VC8ZsNrTCMwpNJd8RYsAFwk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=U6kHhgvB38mcpaVHD3xQMQ7gkE4S6RKF7+1+i4mb5ax6yiH9SkvSn5AQM47+RmU8A
	 hkZNl7asFVA5bKwmjnC/noKRqxq5YNCa4EjFspchV933cST7b82WZD7c9wB7W1cB1N
	 p9JYZyHG2u3g30V56I/PzRaFItMG7h7xXxBKO9GDICWxNJqS6zfzGXa3RltRfYoB+l
	 tfXE7hoNnToo9p2/KdyhtPH0CUXGQzP9vlfE8cyPoMnqZoiND/+8k8OAwOjuxstE/p
	 JB5OhPjBI3AXdyXih0VFPf7iBirQIDKGLHzumPNgwu6Q4Uwk/5cZyB0t5bvX6SpjuQ
	 qswwsSP1GM8Bw==
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
Subject: Re: [PATCH] clk: tegra: Fix Tegra210 IQC2 clock lookup
From: Thierry Reding <thierry.reding@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261024110113.63341-1-kmehltretter@gmail.com>
References: <20261024110113.63341-1-kmehltretter@gmail.com>
Date: Sat, 28 Nov 2026 09:31:17 +0100
Message-Id: <179585467757.1887007.15818795989969388952.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=832; i=treding@nvidia.com;
 h=from:subject:message-id; bh=4TUBVna9/bwl0IiOiLvpzVlvjVDGiytdGaGagtKamws=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBrCpFac8mP//F5Gydzg7sAQS4TV7dABH/cCtTHN
 HKJrVYqkzWJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCawqRWgAKCRDdI6zXfz6z
 oamKEACjYEnAQ//j9ixi6wsweWcUIkmWAhTkJzclZDGwkxVDfjbxG0GNfG8ttcbopOdazMUcAlS
 irXHQpnF7PyIEGi0wKRwUNHvrrY9HNABjeHS3E+GDBA/AItfhUZZ7O8xySAYhtU0+8MlTUUmwZa
 qgZo3Yd7lZnRmqMmDBeKzNknrgd6LyQSn24w4BzY5yYfeNma/qyCCcID8pXfrxBASewE4ZKx0qm
 1IPsB+FUwY7ZfnN1waOKL0GSTXha3aA5P9MK2ey2oJqQSXU0/+TdxXB1v3sJCZBBDQlsuyG8Hb4
 Xyy0cs4WVIzcFN4i/S7QSt5DorEe5cG3BiaFS//9cPkPdyX3hasb6lx9/v4boXZn0zxbSGbE2bk
 nUez4D8qyhgR8NF0+bjrmw84LbrrHeKUHVQ7HLqvNJU2f5bIeCW1Y2WJ8WE5w4x5t0MvxxkWLs3
 8aXQW0R2hl00UbmFZ3Vw4/jWjzOen+AmKU53YUcVJSpUCUxhn+ZugltkVzml2j08Wlp7eQ/KVTO
 4/6wcLdIwt3eGSrQ7KZS3BQP8YrCYGtu53F6S3ituYsE4aTMaA2gmPKmHVe8TPh2xPVDKsXg06t
 ZtL6gPVSYiplCjBYt5qwH7uY7Usg060FtSJLqNo7k/nA1QSBpXy+Ff42sfP3zSq6/60haIqrBVN
 lb3zDfLbbWUZKvA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

On Sat, 24 Oct 2026 13:01:13 +0200, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> gate_clks[] uses tegra_clk_iqc1 for both iqc1 and iqc2. On Tegra210,
> gate_clk_init() overwrites the TEGRA210_CLK_IQC1 provider entry with
> iqc2 and leaves TEGRA210_CLK_IQC2 unpopulated, so looking up
> TEGRA210_CLK_IQC2 fails with -EINVAL.
> 
> Use tegra_clk_iqc2 for the iqc2 gate.
> 
> Fixes: 88da44c5edb9 ("clk: tegra: Add missing Tegra210 clocks")

We might want to remove this line. There's no driver for IQC, so this is
totally unused and fixing the lookup doesn't have any impact at all. The
patch doesn't fix a bug, so there's no need to get this backported all
the way to Linux v4.12.

That said, the fix is correct, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

-- 
Thierry Reding <treding@nvidia.com>
