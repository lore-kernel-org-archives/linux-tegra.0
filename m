Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA8418C011;
	Wed, 14 May 2025 16:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239454; cv=none; b=LB8s7Ugcuqc2zvcKR7mxtGhOWd5tdyyVJHMWBXlXaI9dq6Y42GmymfQrCNw7eetOwm+aZNiuuK6QBsDa4f+qnNHl5wElNtZm40wIZwZIO7bLyHKtHP6UIHHiY5uPIRrSjDj6D0AIV6uImZxyxNVQVHOFwMJ/7BxcFxld7Ww7puM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239454; c=relaxed/simple;
	bh=ynRgYDoQpROaSqMAtdzPR1ZOmRAM2GDU/bHhpMLKkJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPVXQo7GnneJ5mQMh+L2OGDBPqNhBQAymwG8RYNznBT7NPaDYbOngb9TGdK98vO3a5EL7CzoT77M2/qIzov6ul+k/3iEzVW6k5YNSEdqJ6J/CxFgNvlW7zYCJ8dY/vb8Z1AsSzI9jPwmEFZX9ZT5siROEf74tiJcKoXrPURelmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssoiA7zZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssoiA7zZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A84C4CEE3;
	Wed, 14 May 2025 16:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747239454;
	bh=ynRgYDoQpROaSqMAtdzPR1ZOmRAM2GDU/bHhpMLKkJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ssoiA7zZ32W+g4oZ8nSfZ0GStHHA0K6AkMc2UkiJAkJ/prvS6zi7RoRNb5i8SeaJW
	 MK42Q20UfDZpt0dGcOUpQLr+8Vlh1GfdlXrBmKGin/VnvGpwv0k/ElKHmZAYh9xGOS
	 lylN7EANwTRxqvSR1BLQpcbbQgzH2RDqqr76s6n3+8zRdkJFa4OVi/7rbKdQNqnN/U
	 hKdIDBZMZGMpfFCJRL+XM4fbT+AyoByXjKM0unGuyMhJu2zUC0ZWOOeAW8BPYQuQts
	 gUAU5RLesGgveUQidXd62yHU7LE2KRDFuMqAhuCQAbaTIKwhqeLKSjO7WQo3tEm3YX
	 amgH6H8YW4wZg==
Date: Wed, 14 May 2025 11:17:32 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/11] dt-bindings: mailbox: tegra-hsp: Properly sort
 compatible string list
Message-ID: <20250514161732.GA2492164-robh@kernel.org>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-4-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506133118.1011777-4-thierry.reding@gmail.com>

On Tue, May 06, 2025 at 03:31:10PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> We want these strings to be sorted in order of release date of the
> chips, so the Tegra264 entry should go after the Tegra234 entry.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> index df6784a7c96a..cbc02b2a156a 100644
> --- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> @@ -66,10 +66,10 @@ properties:
>      oneOf:
>        - const: nvidia,tegra186-hsp
>        - const: nvidia,tegra194-hsp
> -      - const: nvidia,tegra264-hsp
>        - items:
>            - const: nvidia,tegra234-hsp
>            - const: nvidia,tegra194-hsp
> +      - const: nvidia,tegra264-hsp

The preference here is really to put all the single entry cases into 1 
enum. Order by release would be okay, but not something the DT 
maintainers know or can remember which bindings do that. So alphanumeric 
order is preferred.

Acked-by: Rob Herring (Arm) <robh@kernel.org>

Rob
