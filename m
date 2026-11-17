Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915230;
	b=wTDnI8Cl9jpQXbPNVdOUczPD2jq363W8/0buWFaGqKpmBtUk5esh4MLnE6Pm6xsuZAJ7
	 b/0UljUvNmUvRBso24cdDo1EAc1czF1nAb3zXHLhULRAlk0hxcR9En8Uo9dhrkRyFiPap
	 DZ2WajvZQIYXTaUo+6xoe+jpmDmNn3BCpRKxNnZ8DCN34MvEANMXGJX3Sp7pqT8RO04dW
	 1KLJuw6T1NegdvwEnbFC/WJnYrMEekRN+ktTgK7aMlbasBgLiDseoSYMsIcx3hwVlZb6s
	 m6GcsffmkNhdBttG3kyc9jnRlOnNcaYv9w0Be5RKrDgbvaIllox4DAjU3Djvbypkv3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915230;
	h=Received:From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kjXAaXK6hQb/XXAPNwyN4JZO8nJotie+Ok3HcmhEFCE=;
	b=NBX+5EHRgbTG99hHxHIfyu9lLA88WhlK11Mkmxb0+Kyq5PaIDU4lPR3CMdRbOFvzPtfj
	 ImMnHqPJSJ8YUa2tXNX4k9J8ys5suOpEi2We0bPfu3dy3S8t53fA3UPuYIjC7j7gsDb6b
	 dkS8tRqih/23iCfFO4YAH/E+m9FplArWdf+ztc3T/5QW4Lo0kYijhBZV8mSSSCWxl8u8J
	 mWsRw94VFIzZAoXQdWtE/vqMRFn/T4+Gzn8ziylaIVlgSFjQHFKQbBgRK7bZc2VvvPeNv
	 kFPsdfbzbRHwe6OaQ0RKccU64+fCd22HC7osOj9uJ1BijoxXtpMvhiL3oPO84tVQYlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C0606A31C;
	Tue, 17 Nov 2026 11:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0121F000C4;
	Tue, 17 Nov 2026 11:33:49 +0000 (UTC)
From: Thierry Reding <treding@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>
Cc: Sumit Gupta <sumitg@nvidia.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20261030141101.845044-1-thierry.reding@kernel.org>
References: <20261030141101.845044-1-thierry.reding@kernel.org>
Subject: Re: [PATCH 1/3] arm64: tegra: Fix address translation on Tegra264
Message-Id: <179491522089.28851.706571593758877456.b4-ty@b4>
Date: Tue, 17 Nov 2026 12:33:40 +0100
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=530; i=treding@nvidia.com;
 h=from:subject:message-id; bh=q1slLfOKQxL+mlf4j90HFWk8qZw/bT+KR5uqMVpdt7k=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBq/Duc6TC5f85T5Ccw7kzjINcTUxBR1TgGZmvil
 pKVBPFYtb+JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCavw7nAAKCRDdI6zXfz6z
 oX1iD/wIDerM7zPJcOnSKKQVnqi5AeaA0keVtyoEdJxTOfzhIVJ6vNr218cBrydq8ykicVq4aXh
 1/YYIizIYEMlNJPXt5ZhOtA1y1Ke1Rs8+jp1BeGNkoDftMekYQHItoWmOEBknsHHDs4+BXMJChc
 IMFanN3ERXpBYfCQXwO5NETDIG6P5MZO6IgK3pSLHppOoka3ANQEiehfCziHAvG6B/VUjAiuFFU
 64W5Uywn/2HNMznoNVUgG64PHlaZD2x+8Q/NgpuiiRwGOY+bphiqntUx8vq9D1x2RV6uwOyXYcX
 hh6sC7r2UT0FyoCIMBXw1Qrjh75Jc0hOwPrfdg3toAnxabGQDRvnJOvi2vOqEawprR6qrfsMZtw
 t+FHR8Uj32LQ4bfSB+XouV4qLECt5HpL7/1JXDexfNNO8KQ66nvxcmRo8q7YMyZAMi4FEwtFAZr
 OtFGl9PT0pXEaZ/qaVU062czJhlyobuRyYDxUL4vk4TpDcGFFrxnUPUIrYvcYyem7gOWnDljChD
 PTXjJLFoQmbx7ExMANMT8oFUcFMhCf5/x/ENGONlLeNvqPaLXqMzZ9GNMMED8WSm7n/US8nPcvB
 F11CuMelti16XC/Fm6d1SPkocWcNMDifuKFSnqw9hY/0FCto2SFpnlREalMs4NONz9Lb3Cgcp8W
 nmBzdf0nf4AonLg==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1


On Fri, 30 Oct 2026 15:10:59 +0100, Thierry Reding wrote:
> arm64: tegra: Fix address translation on Tegra264

Applied, thanks!

[1/3] arm64: tegra: Fix address translation on Tegra264
      commit: 168fca2ee5e60e649b3d476e451f7833633a1455
[2/3] arm64: tegra: Fix memory size unit in comment
      commit: 17c5a5ee525da79ab1ca0a5b92190a0587604643
[3/3] arm64: tegra: Remove PCI ranges from VISION chiplet
      commit: f87ba646efb4afd159a418c43b0d95062eaae1f5

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

