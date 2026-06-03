Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE45B409123
	for <linux-tegra@vger.kernel.org>; Wed,  3 Jun 2026 20:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519447; cv=none; b=OIyWLYVbVkVes5OfEHAaymd70OBrNKyU8k/A1fusoxY4gbuX+2E/NP+n0ZuCvIutsCwDaCG5EAKjatvoj7+tC1YGxDyx+NcLiUQAUugcoeuzFGKuv2EZOhdB0KJ1Zswm2f3LggLzD8QdhMAqeTKvlGByvXVrpaYXilfcJdw0R5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519447; c=relaxed/simple;
	bh=1VgHiEy4LZCKpTLkS9uhtOQ9zMOOI5+2vy09ZAAS624=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iw9w9C72VkReMNC0XO6ozK9B3n/2wzzib/zmc5SvnqMZfhNHFzbitooW9WgU8bb4X7FASz3PNtC7FTizH49Hb8T4R1dUqcIGIZapmGJO0cYp91lhG+puQX3CNvZZ6YDsDFMk3BBPvv+i4RG3L6IYB22L1b6oNnwG+OV/YlvDKrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PT1+lJi/; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PT1+lJi/"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4864a5c83f1so1587663b6e.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2026 13:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519445; x=1781124245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWkxW7Ud9tasihZM1AsETVa4enpdjUpARrEAwS6/9NY=;
        b=PT1+lJi/dVYSSC+fFoYHIJrGX9eMjKdSl476Uq9/CyTks5EULnBzI+7eCrWu9tCyl7
         Ld1H8U7yUkY7YHV1symkS6+rVED9QEQ3JN/bckDHENZc2zy4lUWMGCkC0pV55dNgRQ30
         c30GJghRC2z2yv3DxxpteL1bPrBx0EBd9iIWLLUztI7M63Fe5jrl4C8wE8VtOMtlAQX0
         WNo+Gh7X4gEUz0IyrgvkLEk5rOPzRl0JoXTF7d4Jn0w1tDWoXvbOFgBTdsIjzvPFrgzz
         Yhxx9TBiuxpTtU80FiuhQNCII8hH466uUQw3YDokhGYhIR6N/DwYkfA/nx8w1Me5qpoE
         wAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519445; x=1781124245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HWkxW7Ud9tasihZM1AsETVa4enpdjUpARrEAwS6/9NY=;
        b=AA6+NfgLiWIZh2k34K2ekRBDzp4oiCCu0ViW29sOvffPLppiX5fFv8Chwg7P2ijFNv
         C5Q3LEf8KXKyUiKFYI9WR4/ksxVWFootQTjUoq/dgXsyqgl0SMMviTuNkIydHypzH/y4
         wdauCr4bTTWZN+uAZ7TZZL7hKO3Pe4Iop2RKq7a2CJpiwweBpyqpVEtp7ZOBQlmY1PE4
         DJPvqf03nz/KfGZtjIt0Vil7VO6DvhWxnesrz8IQ3T61aarI7iH9WgXtQ4LeRi8jPLNs
         T4VaZBYifXs2ntHN3iJN62sk6Uf3dMUUyd2mVjyIdIxN0z0PUUBECHWNMBDapo5DR7hf
         nYIw==
X-Forwarded-Encrypted: i=1; AFNElJ/qH8bH0RCcoIkBpbJ3E/fANTyE6rhWGvQh3d3zRCYG+rm8JYUax1QX4kUAcdztb6Cug2b/RyVq1CxHlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUtaAWc722B3cskQdcSkVPY7PA1AEhOzDzVSo4MMQAJT7Q22aO
	WqFIBUGuhUKbJsPHkXs76W5TE1YJsGTBbE0Ea0v8bhcBFm7dYSixA+Ec
X-Gm-Gg: Acq92OEITPYHn83G8aNCmgfXTaySaF+vd23H/nEcAJmGA+glYwDnNVKg/RNVwzinWCk
	YeqLurhCybCjooW0n+SnRN4RBlCmNS1LJ0j1g2k5kMZcms3ev/Jygr9uNJC69OI/7gmOVUr9usI
	p3snsT/4NWjni56vurv1EYQmANt383a6yZQ7qtgyx2/AH008JumfxEzbjUlHlErGfyXcaNUKykq
	qdflF6nCiNDfYELiqJiQs4oyhhzito8yFE6kP+apgfgyxyibdu8MF3APLOArXidOSzRbO1L87Dk
	6iH4uQfu7eIMRCYaC8IpbJosoQ/5A3ORGDo0XqGpdf95sCwFS2ORKFyl/eFkkQBjUF9E4ujWR/i
	1ZqXs4X/nkWVTllYTmlT+71AP4Oe0NwPYeLxFhxYlLFXIUe6mr8BDwUcbS1ev2FXOa+rR+hTMYy
	2UNJGXh9LGOsK80Yw05Gv/n2i9fPalyTNXYFYpPOy7jHceYMkR+A==
X-Received: by 2002:a05:6808:1a19:b0:467:58e:5d4b with SMTP id 5614622812f47-4865ab31ed2mr2926769b6e.20.1780519444730;
        Wed, 03 Jun 2026 13:44:04 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm2667962b6e.4.2026.06.03.13.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:44:03 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Date: Wed, 03 Jun 2026 15:42:18 -0500
Subject: [PATCH v2 1/4] dt-bindings: net: remove obsolete mdio.txt
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-remove-redirect-stubs-v2-1-c8c19876ab64@gmail.com>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
In-Reply-To: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vladimir Oltean <olteanv@gmail.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Akash Sukhavasi <akash.sukhavasi@gmail.com>
X-Mailer: b4 0.14.3

mdio.txt has been a single-line redirect to mdio.yaml since
commit 62d77ff7ecbf ("dt-bindings: net: Add a YAML schemas for the
generic MDIO options"), which introduced the .yaml schema and reduced
the .txt to a stub in the same change. The .yaml has the same filename
in the same directory, making this redirect unnecessary for
discoverability.

No files in the tree reference mdio.txt and it has not been touched
since June 2019. Remove the obsolete stub.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 Documentation/devicetree/bindings/net/mdio.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/mdio.txt b/Documentation/devicetree/bindings/net/mdio.txt
deleted file mode 100644
index cf8a0105488e..000000000000
--- a/Documentation/devicetree/bindings/net/mdio.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has moved to mdio.yaml.

-- 
2.54.0

