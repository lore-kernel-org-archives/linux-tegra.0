Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2049B24A05D;
	Thu,  4 Jun 2026 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579064; cv=none; b=JCJ8BCzJWMlLVvL8a7ENZSomMZDZbMJiGPBtnurCOjo5clquH0MXIb4is566dWlZymMFZnvTw1oHUcLUFop6Yl2IwUydL9wsQ4tBgWtpBwOl5xUQB2pIlPAiHcn9ZoLpJ2aeqQYMBvdhhm5qU9CmhWI9WOD5OgfnDsIw+nCH+pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579064; c=relaxed/simple;
	bh=issduZWBIJdrP3/L0IBXwuh1Vb/0kdTF6VTuMsNPxMo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hGsgYh6UY+6gelEvnMYbMABipjk3wsXcp0N5flT8T/UZam73asXcPVaT8aOiB/cycjJVqD6jAWQ3wq4snU1K9jSKCl6J2ELQLWkJBzGeFb8bdDcT6OxBDbq6BdbCOwzPohWP0XdADIoHTxidD2/PovvUqfd9ZYXnEOuEvI35Co4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6s9r21G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6s9r21G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20CD31F00893;
	Thu,  4 Jun 2026 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780579062;
	bh=MlSBdLkLFKGREcCWJ2ppOtNh082oDhlkpVJCJfiPFFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O6s9r21GhJcr1xWIYmD2eixACqjik+4h9RY+HBKB03/Wmb+ANDyp74YaCA9stPYzB
	 X5oMMHbUoNu5hzdAHc1b3rYDcyTpsP7UY4ykAMsAePIF2/FRCGevpWV2+NNoGMdzZE
	 mjcnTbXrwO7FDULzRFyqyeJqNQP7B6iR3M/cksxEYSkjfPpPHjqBbxKchfWrBfhjo+
	 36k9X/iKw0pBSj1cgm2TsXwTAQfCbkkSCcrf4WKha4nH64fFFarUtnBdbSyd9/Ike4
	 jMCB1MNL7tP2KMBSObCw3z0e0vtJl08RDJFDN7e3a9YC+9tPrJCRVe1rvhqdQZOOPS
	 QDTl0jqjEQw5g==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260528221928.142511-1-rosenp@gmail.com>
References: <20260528221928.142511-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] ASoC: tegra: ADX: use of_device_get_match_data
Message-Id: <178056909266.53724.607869411013236988.b4-ty@b4>
Date: Thu, 04 Jun 2026 11:31:32 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109; i=broonie@kernel.org;
 h=from:subject:message-id; bh=issduZWBIJdrP3/L0IBXwuh1Vb/0kdTF6VTuMsNPxMo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqIXr0ux7qytaWHCq1yc3VckADibgKeoeT2HSgn
 7PCYkpcnxiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiF69AAKCRAk1otyXVSH
 0LCyB/wJaXcWsOBkD+3yoloPADitVXgo77QrWE6yD9PTCue1byaZSnySsS7kPdReIOOOOOmfPar
 O4OEje+n/tc+EYvih1N3SxPWJtDzGySE6BcHhONA8aVUPDtPtLqlpCBuzEdYIF+rwWzvavLOv/U
 Gpw0X7llX6iVyf+2+BYXgBL4Conrtv+mkol4O51opCw6iDvwYjWzlv4iM3KXKLHSo4H8RmL6Ybe
 fiA2p4cwPCFE3XKnvKasssEAHx+E/du9gk58IWgotaI4z1Zo8mAXkiHZ4UWWOMDQJW3fQWmYNJk
 N3BJM2iB4/JVcoJPFIOTCDRHfSYWpn4immUQeIyWTAZXB73q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 28 May 2026 15:19:28 -0700, Rosen Penev wrote:
> ASoC: tegra: ADX: use of_device_get_match_data

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tegra: ADX: use of_device_get_match_data
      https://git.kernel.org/broonie/sound/c/ce3d971735bb

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

