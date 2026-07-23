Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA744334D1;
	Thu, 23 Jul 2026 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799572; cv=none; b=SlfXl7r7BL09X5Blg1+jc3Qzep/zK7AJrJrN+6D3+Ri9IGkcElNxZ6Ti3JwfbphiKglU30t3CSv7oUSvWy9QKGb8mtuXJYdhrUGX3MtUn5l0RM5xZVB5SW997gpIxkkquDEDUAi2ZapK+sUgGSwxtXM9vIkY/pbs1FsCy7x4WEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799572; c=relaxed/simple;
	bh=rTh6wtCLa7IrdLZ28Kq68nU4MTx4V6bR4yG3TrjBSS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtiFy7IdLFvg6ym+Z3bE7TF/h1POB7cC/IE1qa9uZMjbyhjcAyPFLGVIfq7dq+Mn7zLk6AGaUPkPZlttihl5Bsla4M+bEnIDlERhV1f483rb3OI8lkXr/7wC9t+Wc6fixKJtbluEjltCoSeX/OoR2WI3OJDTPKP8B21vNAdeuTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=4GJ/UGXK; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="4GJ/UGXK"
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8sIHX2325546;
	Thu, 23 Jul 2026 09:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=UZtN4+71vj
	4objsOy7KMn6loza8lnIOPo4NWAQPgrK4=; b=4GJ/UGXK7w3PmhEGdGpG77J81Y
	exvXpFbn/BNQyqxMVLsl9FAyVj7MWtj5AH8WfMvAGmlDAI47SQIQzM6C489yJ4Kr
	+muR9LFSa1/QVuuS2RwcHX1fMA4N1Ji0W3Ch97+hfNaXFT1iJ5hOeIaNlNB+hSMk
	pZEH/uhFjOL6KC6OL/CVhqTLypjMxb29SKFKXMvH4Erv9iNzXJ4pv9vzH0or+23b
	6m511KhtM5APUO15NjKrbnkDJ3V9kWCP4/8/W4Gb6siVKQRJNnaL7Jnh9/8ePOa3
	A6AaaVcvadxKJtzmev/I57vmX6+LsEKZIb7n3fWOYq2AUZNYS33iJOyfbeSQ==
Received: from hkglppfpool1.lenovo.com ([103.30.235.218])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4fgq8g16bw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 09:39:19 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool1.lenovo.com (Postfix) with ESMTPS id 4h5R0P2q6Rz9vVtk;
	Thu, 23 Jul 2026 09:39:17 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4h5R0P2L5tz18W8pb;
	Thu, 23 Jul 2026 09:39:17 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: mperttunen@nvidia.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, jonathanh@nvidia.com,
        krzk+dt@kernel.org, krzk@kernel.org, lijq9@lenovo.com,
        linux-tegra@vger.kernel.org, mpearson-lenovo@squebb.ca,
        robh+dt@kernel.org, thierry.reding@gmail.com
Subject: Re: [External] Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 device tree
Date: Thu, 23 Jul 2026 17:39:16 +0800
Message-ID: <20260723093917.895242-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <qH2CwJ61SfKj2xT1jc5N9Q@nvidia.com>
References: <qH2CwJ61SfKj2xT1jc5N9Q@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HYAkiCE8 c=1 sm=1 tr=0 ts=6a61e147 cx=c_pps
 a=yIlUyoB/d3ZP/uZUHEUQoQ==:117 a=yIlUyoB/d3ZP/uZUHEUQoQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=hJVLCblJc-VYA0_z04R5:22 a=voM4FWlXAAAA:8 a=suagau-rg9_qL2Wug8AA:9
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: rbkCuITroNMgnWHw0OpU9dhkLQFcHzJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NSBTYWx0ZWRfXxfnSSgs/Y37+
 r5s81K1y1+kYNC+9BRmK0fD+SH8cgBHjg0pxNTE50EUPu8mS/S1boObNCqkpOMjyonJz/ABLLS3
 LIEJKcXa/UXlysGEmdQ/PFdOzNHs8G5RKii6i8u9/6BayPiNUBurcCuPFWrw8eUwafE+zTTCek4
 vuMYnX11nP79oQSbcrLYEP4+FTNk0S1HSviKRehS2OK8DhOKDP0NcQXkAaEh2qKh/+gCAwVD5Qw
 osYUbUxvODJNj4DIwcUSmed3PbcAvPlGnqLvl3L9j06WrUDpH4+sJtCUY4oZajGlfhE8gVhFQ2Z
 MYepGjkWq4+yNrEe5yUxLAb/waf7gNIVDPl7hTIWO3zU1J6Jk6XOtnQv/qQloa+Zr1yy+Y0FLYL
 TmCVoqQqKeMFhoymEs9V0k9lNcMtPYNHh2Tk661IG7B0ZAYAiHruYxDdAxxKRgfEAo0XNEvFD7g
 UljBgAyiOgmry0aksNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NSBTYWx0ZWRfX/kGb+5CM+VqJ
 wBwHcnm1Vx787vNcuVqtpPXb3TJ1skLLUXv+HnsC8yBDJmHAUzD8HFmXXxM5Pw+ARoWB6oMrkBg
 ChYjcM/kzCEKAC7W7/frpzy/u5JoeX0=
X-Proofpoint-GUID: rbkCuITroNMgnWHw0OpU9dhkLQFcHzJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230095

Hi Mikko,

Just a gentle ping on this series. Based on your previous feedback, the
v4 patches were sent on July 8 and addressed all your comments:
- Renamed regulator-sd-3v3 to regulator-vdd-3v3-sd
- Moved regulator nodes to the bottom and sorted them alphabetically
- Added a comment to vdd_5v0_sys clarifying it is required by the SoM
  and SoC layers (as it is referenced by USB and PMIC nodes)

Could you please take another look when you have a moment?

Patchwork link for reference:
https://patchwork.ozlabs.org/project/linux-tegra/list/?series=512658

Best regards,
Jiqi Li
