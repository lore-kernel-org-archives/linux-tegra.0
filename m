Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34C418C011;
	Wed, 14 May 2025 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239471; cv=none; b=QV7o/oubYsO4x+mQuUr3IJZfHZ6HFyKnLVtbh2NR8PYPbly1R8i7dYvHlZUC4HRUUe92+E3Bj1ayWMvODoPSwCZFKZNUyB/h5+6xZ4yMn9K9+nyUsnTB8hKCfD23IiRvih51YN+O2f1YLuIZ9lJXRnYjSiUa+cgh+Eed6nPNly0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239471; c=relaxed/simple;
	bh=aqUoPtC1xc3xR9sEMf8NIVU+ZgOW5Hbhj8zK97ZrDzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDUBvvzCt4PUMQ9Hx6dhWokok5B8WgHj2ae3DlPl8jLBWEu/vxsL4jSB0h50yF2cUwpohw5QvDjFBK8lIVQyKO3WEcndRcKhMUVek42BBSY2xZ8BBEcRP29C/ZQ/TBWhAgS87TIgnZ8eUFMrFmCR85aCD4N7ueiW8DzjDvZDLWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sq4ITlmO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sq4ITlmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47427C4CEE9;
	Wed, 14 May 2025 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747239470;
	bh=aqUoPtC1xc3xR9sEMf8NIVU+ZgOW5Hbhj8zK97ZrDzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sq4ITlmOF1IOOxPyyWtXgca8yT3bBrZZi9gdMX9Iw1DuwVQpBYo2iMF7Pd/nNTy19
	 O5oaVqijiH5kpwJ4nr+7Expd5Ml5SpoHwLgB2roMn3biWp7W3eKzAnsFoqOAa9Lxlp
	 7iCG6eF0QAlIUsKzRMaRdbRpuwYX83RM+Uab9BnrzYwI7OIdSfiaPJcFfPxyEyjXEt
	 moMkoBsVBIQVi/yoT7OxCnfzJGNVCCNGdlgWmc6LipOX3ipqO1E6uU4pRCrXSC3UOf
	 CciIWgbZfkLHWWgs/iQSNNIigyJS+0r1PEGHniOKezvaxbBLLHiyWc9ekZRgnV4ME/
	 mMAMfmRzfseNA==
Date: Wed, 14 May 2025 11:17:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 04/11] dt-bindings: firmware: Document Tegra264 BPMP
Message-ID: <174723946819.2530421.5585015626188126772.robh@kernel.org>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-5-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506133118.1011777-5-thierry.reding@gmail.com>


On Tue, 06 May 2025 15:31:11 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> While the BPMP found on Tegra264 is similar to the versions found on
> previous chips and should be backwards-compatible, some changes could
> eventually be needed. Anticipate such changes and introduce a chip-
> specific compatible string.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

