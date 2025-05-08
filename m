Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7679E21D596;
	Thu,  8 May 2025 07:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688195; cv=none; b=QprQHJfhQv1YZa286zGtUtoZiaBZz03vUjar8gRqIGPOiIWLc4JWVWVYE9PpXJE/pYV/5I9Qdhz7cqeVUGZOFw7w/Yz7jJulHi4IqyfDAkpQNKiOY/NwdgehQeRjxPEH3KhFRfF4f4gB1Y8b9fHduxJsfd13FmwqdymGfMDTfWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688195; c=relaxed/simple;
	bh=qOdsN6vhSLQCDG9wzMOOucqWx12KN8d4fZu7cJwPzhU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KNQWOn0b61qRaCbYv0nH1sDtKwrGXrjBX+z31XaC6sMjwcj6xJatX1VnSJnf2eMx+bdldrNFj6vZa18W9ByLYREhb9377xN0hAeiUjTyBo5cG90gjcyb510GyryxKM/rbOdowYhO2ZJwAGqDlQizn2UIR8ubESPohihUZTZRefU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEO7+wI1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEO7+wI1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9683C4CEEE;
	Thu,  8 May 2025 07:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746688194;
	bh=qOdsN6vhSLQCDG9wzMOOucqWx12KN8d4fZu7cJwPzhU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SEO7+wI13ipozHxOzsMHBqzgUbVmIagROA+HNlvrxssYaDaZ8pY72zNvw6uzfVn6y
	 GtmVhQ3ZeW6RMtTCb8iXdmvJw4Vu82VT8FKQcy568hyOxquc0fPpIHGAP172FJ083H
	 1Fc7Enx5hp5A+plqFaPmykNxMUAqoNFPm2IQ9tdm6AL8+I10Ebr2LG9I/Mk3sqvdQw
	 q3rdmDK6Va7eQJHZZUYsK/huUu/bCnfZjwsE7Up9nRgEYQ3TXhD6VgaSre/2SvR5dW
	 HR+fmOdnsuCYsIle5JHY4Um0PX5bnbZDop6TdwPiVweePJGc5t6Ffcd8P3H84TthCm
	 Uk0i3c50ueaQw==
Date: Thu, 08 May 2025 02:09:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>
To: Aaron Kling <webgeek1234@gmail.com>
In-Reply-To: <20250508-tegra210-emc-dt-v2-2-d33dc20a1123@gmail.com>
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
 <20250508-tegra210-emc-dt-v2-2-d33dc20a1123@gmail.com>
Message-Id: <174668818805.3553879.14449746176560386642.robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: memory-controllers: tegra210:
 Allow fallback compatible


On Thu, 08 May 2025 01:07:39 -0500, Aaron Kling wrote:
> The nvidia,tegra21-emc compatible is required by the Nvidia Android
> bootloader to copy emc training value into the kernel dt. So allow this
> as a fallback compatible to avoid needing to change the driver.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  .../devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250508-tegra210-emc-dt-v2-2-d33dc20a1123@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

