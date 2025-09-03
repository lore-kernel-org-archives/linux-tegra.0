Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF84636C09C;
	Wed,  3 Sep 2025 19:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756927825; cv=none; b=LsudME2PHmT+45XdjJcC7a5hpACEC3RZ5VJRgoVyvrCqCVxb7SDu8XDvKVyCNP5RiOoOFeWJdU+R+PILyxOm1EwKHOmmsDHE1ljVkW1a/SWjkXzskRUMiOnhljluTIkduN9O/284x73wFl9PUFUYgnCdarZvW583MDZvarnLS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756927825; c=relaxed/simple;
	bh=+xzil/sVgMBAdiMnRT0qcaWqUHWEi1QVZ8JVT0hYILY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mk0KQsdPy6qSWvSudezle2NVUIDXY7cKaugrnsVhROn6Ost52OZK8EYuJHBSFT/CHYxgJFYDhI/yb1K9ti6IHk7lcrUs/31+JvlXjPZPL3/FxGIg5vfOtVjRJzNWef09taPzx3KPcXm0RH1wHd62JreD0h5JOstvzdNOjgtFsZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbxY/3kL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbxY/3kL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27A63C4CEF9;
	Wed,  3 Sep 2025 19:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756927823;
	bh=+xzil/sVgMBAdiMnRT0qcaWqUHWEi1QVZ8JVT0hYILY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nbxY/3kL5DMRYyJJPd4aZ1bFnBJ1Hg36AfhIjCntn0I3mngfEFAey4LA6xQzH2euh
	 5w4VfRm1GOuynH9hBunaOlJseGNJc+IVdPaDxIL+mtxUK2VN/QDdIhC0k/Iu4yyNMx
	 n0F74qXv5BT12hjtMy28c6BK8dLkahXgm/ktATDvKEucG28+NwT5x3xosS0RrZI1HJ
	 aHhqCLZqOSgD4zyb+nYwZX3HHyHsVdXocWJHZiVvjnTi0STFfRdCEUPtcR+j2Dmewn
	 0RV2cVJQCyDPzF+xo+T48B4KeQGbiddHZKziakgOTmFruOrhevtngXZvRCVju5e/9K
	 cdnwr3clKO7KA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151BECA1017;
	Wed,  3 Sep 2025 19:30:23 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 03 Sep 2025 14:30:19 -0500
Subject: [PATCH v2 4/4] arm64: tegra: Limit max cpu frequency on P3450
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-tegra210-speedo-v2-4-89e6f86b8942@gmail.com>
References: <20250903-tegra210-speedo-v2-0-89e6f86b8942@gmail.com>
In-Reply-To: <20250903-tegra210-speedo-v2-0-89e6f86b8942@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756927822; l=1064;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=rvlN/VFiSk4fMaswOe6B/D7AZjiaIQvg0SL5D0yqtS0=;
 b=YkKq8lZfkehrpT3fO7C3dKV037r4tRTVI8oXjEx1ua8/9mSN1NhVlwjNRMnwpBkIDycwYZ3d9
 H0GKjosoV7fDd8JW0ReeqlHCfNNvMUxzu1X/GfCgc8qW11lT6BD2eJP
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

P3450's cpu is rated for 1.5 GHz, but due to the passive cooling on the
devkit, the maximum frequency needs limited to 1.4 GHz to maintain
reasonable thermals. Ideally, the dfll driver would adjust based on
temperature reporting, but in the absence of that, this will have to do.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index ec0e84cb83ef9bf8f0e52e2958db33666813917c..10f878d3f50815d1f0297d15669048ab9cad73ee 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -594,6 +594,7 @@ clock@70110000 {
 		nvidia,droop-ctrl = <0x00000f00>;
 		nvidia,force-mode = <1>;
 		nvidia,sample-rate = <25000>;
+		nvidia,dfll-max-freq = <1479000000>;
 
 		nvidia,pwm-min-microvolts = <708000>;
 		nvidia,pwm-period-nanoseconds = <2500>; /* 2.5us */

-- 
2.50.1


