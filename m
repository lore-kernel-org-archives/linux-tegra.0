Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540B33FD;
	Thu,  8 May 2025 07:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688193; cv=none; b=mnUkAe3hTaFcqQ5omqEIyOi7Af2jbny6H54C5nGO8/f+IV9vS7sRxyeAp3OpH6AL5fHjCn98ykbJfmEaIuH7bzT/q7edQQKRbxSf4bQh+aS4xbOmOnhpkTmJxtQQHlEk+uA86EgpOqrK2AUrAY7l1G+XLXWHoBuMmCcfLM9dTCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688193; c=relaxed/simple;
	bh=PJ/PP2F5c8QPs/bsQK2xCSyZv7Z+aM461X/NRkBVAQk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=pxhZtJa/p3ILvk4IbmMMOMj/YCe5W4lpCt3qDyTvokDMcNVs7jn4rzuY34kR9YHxaseaYB1t0VLgE2VO+dJNdA6uXSRkfZVMVqx56vAH0Hx3ybDnr9WmM6mQ1Wpx2/duFE5NhjkFsZk054LqWoKJMR/FjiVMymvPOcuBf8r9oIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UILFyR9f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UILFyR9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4ADEC4CEEB;
	Thu,  8 May 2025 07:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746688193;
	bh=PJ/PP2F5c8QPs/bsQK2xCSyZv7Z+aM461X/NRkBVAQk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UILFyR9fk90zer2obzv7zlpRwl0SpaPCv0TMv6XnBMOitHG+GBSaTWJUehS7rsJdY
	 XwvK6Qyo4kS6p8Fl6QpWghScF592MPU5LNEK3LFlaKwLT4OQaPwPc6YOLnjGarCjiO
	 XmDAmSM+fWAhtxDViUPrV8M/ec3PTSj3BPEaOm2YsPN89DmypU0ETb+J9tgqn/7/Bf
	 YTU+HAdUFMXMpGxS5IG0EgDA08bu4fz88aKHqd7PrFbTInSjmb3a1bjkQw8fHE0Mt0
	 9VWsWZTXgVn3wxdQXSJjfakhBIhfLYjkUqcP3/3rbhh/wcoEwmfLMV/TTktQDkx8NL
	 lZ7bALj9hdcXw==
Date: Thu, 08 May 2025 02:09:51 -0500
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, 
 linux-tegra@vger.kernel.org
To: Aaron Kling <webgeek1234@gmail.com>
In-Reply-To: <20250508-tegra210-emc-dt-v2-1-d33dc20a1123@gmail.com>
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
 <20250508-tegra210-emc-dt-v2-1-d33dc20a1123@gmail.com>
Message-Id: <174668818681.3553837.11747943637365850974.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: memory-controllers: Describe
 Tegra210 EMC Tables


On Thu, 08 May 2025 01:07:38 -0500, Aaron Kling wrote:
> Add device tree bindings for Tegra210 EMC tables as used by the Nvidia
> Android bootloader.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  .../nvidia,tegra21-emc-table.yaml                  | 1692 ++++++++++++++++++++
>  .../memory-controllers/nvidia,tegra210-emc.yaml    |   38 +
>  2 files changed, 1730 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250508-tegra210-emc-dt-v2-1-d33dc20a1123@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

