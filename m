Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDD82AE68;
	Tue, 22 Apr 2025 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333572; cv=none; b=uKmg6vzoK2jlpw1ptcMKwRjfl/Z8w37ZG+OH5DuQB+oQt+ZtsrBkCy5bO4qzWyQWHL2M3qh4E3YHQt7CE4fQsE2vryo5FUfoX+uMZ6S/DPgdETdP3Lr2bB3c6KJ4Wvmv2x7PGh5msWYUGa0Kxb8WunwezskPNdDUZ+3R1sC6g7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333572; c=relaxed/simple;
	bh=QTtMhN+qUIN28sTfIHm6cAZpcMSYeG7RgKue75sEfOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwUvlhZrCAxi9+Kw1Rn20dWVmsXMkt/nvfEFYBxPMWN3UWf47J+NHI9KhYjJBZjZRE1CcxaM3/cWSt5J8gGmC312KQvYaKwapnsfBkUxCtTyjba6SwHjV9SLWFaIQhWss8pmISrZB+Z/9CfGgB51oQIRMyv6o/Hoquoe57xmWdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIVvTvYR; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIVvTvYR"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acb39c45b4eso772089466b.1;
        Tue, 22 Apr 2025 07:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745333568; x=1745938368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ne0UrOQ10ywUV4yIx/6vzg9wa/Lu7VvCl++7DoTSGgQ=;
        b=eIVvTvYR6WD1RCVQqtvGuj3aVfMgu+pxrNPAJrbim6sr3NGF+hDbo89PhaQ3xx9Szf
         rZD5MUTNTDjafQvSAm9kOdSj98dMTpx0Qmxw+z4KHIVQYgMCgU0CJzQSlZuhSy1Lm9ZY
         AwnIlj0+eJxWkkQhBC8b5pPjObOcrDw9iwqB5ZrKRWNnwKi5SOI+QBXyyhCQ/ttn/ONA
         T919e/nh+kKDy6vgY5huFISfe9GXSyE2KT8EV7VcCK+so+0YOt7jG9IZ1ZqHfAcH3TiT
         vW+TmUdzFAdl4DYXT44WToqzqLosnXMJXTNGi5j+39oH9WZqTSETd/xLIHXhcBKC8AYW
         FczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333568; x=1745938368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ne0UrOQ10ywUV4yIx/6vzg9wa/Lu7VvCl++7DoTSGgQ=;
        b=TOTP7gKmtyD4/FpChMfqgZ5sF4ZdPzMHMcNeLF8gsXdHWPN3+2wEWjybFbiRDZMMm7
         wYMhrJLTgJiz4x9ZgLq79xcLPcQDdLmVLMvuB1m6J8yetrlNW8CLOKWQ5P6djX1PbO7N
         7NlEnfok2JSyKTAzYPHoZc6IA9bBm3pErqWpBxQsGNR3p2sEZM/6Fr3Ks/yDjAwusZHA
         VmOvCKPV2qVbnB1vmstMT/rIxtEiqaHcndwKsVT+Xdf7ONH0q5EzNy8Sx/YLdmULOuKz
         8nvA/rzUpw5CvMvwTGeBX7kU+hnclJVR+nlrvsipfjw6Ne2htJzRF7OHGISf1DZ9tmXl
         G2oA==
X-Forwarded-Encrypted: i=1; AJvYcCVqTNQ2ctHFVnSwuP4/3Zk44NdfGleb7gxASu244IaQF8lTH2cIeGdNxNjPUG99FWVhPfpH1DJFwbeYyb0=@vger.kernel.org, AJvYcCXUvGonwvvhKL+Y69rJ6Zl6xjaeMhXlde31mXicyo9Y0xyE3wpxzeX9qQ5H935vZ/i5f778X4dHXBuF2UE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNkdeCIfqMSKMTHvbhbh1fQuFrC0Fl9nD7has9U9qW/EGSyvP
	U+b/5TM3BSWadXeno/UtTAomEjdjCTIM9EdiND2cars/10uyIxT3
X-Gm-Gg: ASbGncuuk1uxxUP1PfgtulOerkI24LOEyPjsc32N0rUZc8niGtFrlTcdbfwKy6n9FsJ
	1fCfT8sAeT9a1pokTEP2zR/779sU+BJ+8wfU5Ol9vmhCUHHIngjwbynf6ghFPtO6VPc6EW2oLoB
	7uSo+jc3WWgalJMEbT/T6OZ3m3JbrRp1wy/EeVAER5i/geMYCRmy/tTzP8NFufTSU2lPI17wOrq
	ZfHOzao/XT/cBLWbqy+i77PkZ5hwyIDIB2rg9/KJdV1YBYPtAtMZby6YqVfMnk3Zb8739IOC6gN
	b+NjCGLw1wVzBFG+J3tQ8V/2wmZGIi/dsBdMO1rMvy8=
X-Google-Smtp-Source: AGHT+IGb9MBfCkRoB/jqq7loWg9l+w4QKcOEEXBWwwBNICQDiX2ECXBkrt0pwz/SUpiy+0yG92zd4A==
X-Received: by 2002:a17:906:6a1e:b0:aca:c924:c14 with SMTP id a640c23a62f3a-acb74b34dbemr1383647666b.17.1745333568369;
        Tue, 22 Apr 2025 07:52:48 -0700 (PDT)
Received: from [192.168.1.101] ([212.106.161.104])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm657013966b.162.2025.04.22.07.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 07:52:47 -0700 (PDT)
Message-ID: <d0da9dbd-7ea7-4047-bab3-22f416c45938@gmail.com>
Date: Tue, 22 Apr 2025 16:52:46 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250420-tx1-therm-v1-1-58516c7fc429@gmail.com>
Content-Language: en-US, pl-PL
From: Tomasz Maciej Nowak <tmn505@gmail.com>
In-Reply-To: <20250420-tx1-therm-v1-1-58516c7fc429@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi.

W dniu 21.04.2025 o 00:42, Aaron Kling via B4 Relay pisze:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> This is based on 6f78a94, which enabled added the fan and thermal zones
> for the Jetson Nano Devkit. The fan and thermal characteristics of the
> two devkits are similar, so usng the same configuration.

Does this work on Your DevKit? Doesn't on mine, the fan won't budge. Maybe the
revision difference? What I'm using ATM is [1] and [2]. Because inverted polarity
of PWM, not submitted since that'll need the driver changes [3],[4].

1. https://github.com/tmn505/linux/commit/a78c520ec94aeab2c9dc8e1f46597c4174ff957d
2. https://github.com/tmn505/linux/commit/99beee4f0cd5d3a6f30e1829d823c11cb8b54bac
3. https://libera.irclog.whitequark.org/tegra/2024-07-19#36707118;
4. https://libera.irclog.whitequark.org/tegra/2024-10-14#37145211;

Regards

> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 60 ++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> index 83ed6ac2a8d8f403fb588edce83dc401065c162f..bc02f2eb14bcbd99627c58b398bbf43061c8110b 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> @@ -1623,6 +1623,14 @@ key-volume-up {
>  		};
>  	};
>  
> +	fan: pwm-fan {
> +		compatible = "pwm-fan";
> +		pwms = <&pwm 3 45334>;
> +
> +		cooling-levels = <0 64 128 255>;
> +		#cooling-cells = <2>;
> +	};
> +
>  	vdd_sys_mux: regulator-vdd-sys-mux {
>  		compatible = "regulator-fixed";
>  		regulator-name = "VDD_SYS_MUX";
> @@ -1778,4 +1786,56 @@ vdd_usb_vbus_otg: regulator-vdd-usb-vbus-otg {
>  		enable-active-high;
>  		vin-supply = <&vdd_5v0_sys>;
>  	};
> +
> +	thermal-zones {
> +		cpu-thermal {
> +			trips {
> +				cpu_trip_critical: critical {
> +					temperature = <96500>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +
> +				cpu_trip_hot: hot {
> +					temperature = <70000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};
> +
> +				cpu_trip_active: active {
> +					temperature = <50000>;
> +					hysteresis = <2000>;
> +					type = "active";
> +				};
> +
> +				cpu_trip_passive: passive {
> +					temperature = <30000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +			};
> +
> +			cooling-maps {
> +				cpu-critical {
> +					cooling-device = <&fan 3 3>;
> +					trip = <&cpu_trip_critical>;
> +				};
> +
> +				cpu-hot {
> +					cooling-device = <&fan 2 2>;
> +					trip = <&cpu_trip_hot>;
> +				};
> +
> +				cpu-active {
> +					cooling-device = <&fan 1 1>;
> +					trip = <&cpu_trip_active>;
> +				};
> +
> +				cpu-passive {
> +					cooling-device = <&fan 0 0>;
> +					trip = <&cpu_trip_passive>;
> +				};
> +			};
> +		};
> +	};
>  };
> 
> ---
> base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> change-id: 20250420-tx1-therm-9fb3c30fa43f
> 
> Best regards,
-- 
TMN

